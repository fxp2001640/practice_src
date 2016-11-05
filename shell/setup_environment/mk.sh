#!/bin/sh

QSDK_DIR='/home/xpfan/source_code/p4_src/xpfan_p4_src/depot/sw/branches/qsdk_2.0'
CUR_DIR=$PWD
RUBY_VER=2.2.2
RUBYGEMS_VER=2.4.7

installed(){
	grep -q "$1" $CUR_DIR/installed
}

install(){
	grep -q "$1" $CUR_DIR/installed || echo "$1" >> $CUR_DIR/installed
}

#error for error: could not verify the tag
#rm -rf ~/.repoconfig
#curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
install_git_repo_p4(){
	sudo apt-get install git git-core
	mkdir -p /home/xpfan/bin

	installed "repo" || {
		curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > /home/xpfan/bin/repo
		chmod a+x /home/xpfan/bin/repo
		install "repo"
	}

	installed "p4v" || {
		curl http://filehost.perforce.com/perforce/r13.4/bin.linux26x86_64/p4v.tgz > /home/xpfan/bin/p4v.tgz
		cd /home/xpfan/bin && tar zxf p4v.tgz && rm -f p4v.tgz
		p4v_full_name=$(ls /home/xpfan/bin |grep p4v)
		echo 'PATH="$HOME/bin/'"$p4v_full_name"'/bin:$PATH"' >> /home/xpfan/.profile
		install "p4v"
	}

	installed "gitconfig" || {
		cp -f $CUR_DIR/ubuntu_env/gitconfig /home/xpfan/.gitconfig
		install "gitconfig"
	}

	installed "run-vim" || {
		sudo cp -f $CUR_DIR/ubuntu_env/run-vim /home/xpfan/bin
		install "run-vim"
	}

	installed "git-scan" || {
		sudo cp -f $CUR_DIR/ubuntu_env/git-scan /home/xpfan/bin
		install "git-scan"
	}

	installed "pack-akronite" || {
		sudo cp -f $CUR_DIR/ubuntu_env/pack-akronite /home/xpfan/bin
		install "pack-akronite"
	}

	installed "compatible_with_old_p4_workspace" || {
		mkdir -p /home/xpfan/source_code/my_perforce_client
		ln -s /home/xpfan/source_code/my_perforce_client /home/xpfan/source_code/my_perforce_client/xpfan
		install "compatible_with_old_p4_workspace"
	}
}

download_ruby(){
	installed "download_ruby_src" || {
		mkdir -p "/home/xpfan/source_code"
		cd "/home/xpfan/source_code"
		wget http://cache.ruby-lang.org/pub/ruby/2.2/ruby-$RUBY_VER.tar.gz
		install "download_ruby_src"
	}
}

#please see "/home/xpfan/source_code/ruby-2.1.1/.installed.list" and "/home/xpfan/source_code/ruby-2.1.1/.rbconfig.time"
#for ruby configure and install details
build_ruby(){
	installed "build_ruby_src" || {
		cd "/home/xpfan/source_code"
		tar zxf ruby-$RUBY_VER.tar.gz
		cd ruby-$RUBY_VER
		./configure && make && sudo make install
		cd ext/zlib && ruby extconf.rb && make && sudo make install && cd ../..
		cd ext/openssl && ruby extconf.rb
		sed -i 's/srcdir = ./&\ntop_srcdir = ..\/../' Makefile
		make && sudo make install && cd ../..
		cd ext/readline && ruby extconf.rb
		sed -i 's/srcdir = ./&\ntop_srcdir = ..\/../' Makefile
		make && sudo make install && cd ../..
		cd ext/json && ruby extconf.rb && make && sudo make install && cd ../..
		install "build_ruby_src"
	}
}

install_gem(){
	installed "gem" || {
		cd /home/xpfan/source_code
		wget http://production.cf.rubygems.org/rubygems/rubygems-$RUBYGEMS_VER.tgz
		tar zxf rubygems-$RUBYGEMS_VER.tgz
		cd rubygems-$RUBYGEMS_VER
		sudo ruby setup.rb
		install "gem"
	}
	sudo gem update --system
}

install_qsdk_2_0(){
	[ -e "$QSDK_DIR/.repo" ] && return

	mkdir -p $QSDK_DIR
	cd $QSDK_DIR
	repo init --config-name -u ssh://qca-git01.qualcomm.com:29418/releases/manifest/qstak.git -b banana
	repo sync
	cd qsdk
	make package/symlinks
	cp qca/configs/qsdk/ipq806x_retail.config .config
	make defconfig
	make menuconfig
	make
}

link_platform_compile_tools(){
	local platform=$1
	local src_from=$2
	local src
	local tools="objdump gcc gdb nm addr2line readelf strip"

	for tool in $tools
	do
		src="$src_from-$tool"
		dst="/home/xpfan/bin/$platform-$tool"

		[ -e "$src" ] || continue
		[ -e "$dst" ] && continue

		ln -s $src $dst
	done
}

link_compile_tools(){
	link_platform_compile_tools "arm" "$QSDK_DIR/qsdk/staging_dir/toolchain-arm_v7-a_gcc-4.6-linaro_uClibc-0.9.33.2_eabi/bin/arm-openwrt-linux-uclibcgnueabi"
	link_platform_compile_tools "mips" "$QSDK_DIR/qsdk/staging_dir/toolchain-mips_r2_gcc-4.6-linaro_uClibc-0.9.33.2/bin/mips-openwrt-linux-uclibc"
}

install_l2tp_server(){
	sudo apt-get install xl2tpd
	sudo cp -rf $(CUR_DIR)/ubuntu_env/xl2tpd_configuration/* /
	sudo ifconfig eth0 192.168.10.1
	sudo /etc/init.d/xl2tpd restart
}

install_pptp_server(){
	sudo apt-get install pptpd
	sudo cp -rf $(CUR_DIR)/ubuntu_env/pptpd_configuration/* /
	sudo ifconfig eth0 192.168.10.1
	sudo service pptpd restart
}

install_kernel_code(){
	if ! [ -e "/home/xpfan/source_code/latest_linux/linux" ] ; then
		mkdir -p /home/xpfan/source_code/latest_linux
		cd /home/xpfan/source_code/latest_linux
		git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
	fi
	cd /home/xpfan/source_code/latest_linux/linux
	git pull
}

install_xpfan_terminal(){
	sudo apt-get install --no-install-recommends gnome-panel
	#gnome-desktop-item-edit ~/桌面/ --create-new
	[ -e "/home/xpfan/bin/terminal_startup_cmd" ] || sudo cp -rf $(CUR_DIR)/ubuntu_env/xpfan-terminal/* /
}

install_appjs(){
	sudo apt-get install npm
	sudo ln -s /usr/bin/nodejs /usr/bin/node
	sudo npm install appjs
}

$1

