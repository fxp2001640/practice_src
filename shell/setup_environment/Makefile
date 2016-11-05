CUR_DIR=$(PWD)

all : setup_linux_environment install_ruby install_git_repo_p4 install_ostinato

clean :
	@echo "#list of installed software" > $(CUR_DIR)/installed

install_ostinato :
	sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/pstavirs:/ostinato/xUbuntu_12.04/ /' >> /etc/apt/sources.list.d/ostinato.list"
	sudo apt-get update
	wget http://download.opensuse.org/repositories/home:pstavirs:ostinato/xUbuntu_12.04/Release.key
	sudo apt-key add - < Release.key
	rm -f Release.key
	sudo apt-get install ostinato

link_compile_tools :
	@$(CUR_DIR)/mk.sh $@

setup_ssh :
	if ! [ -e "/home/xpfan/.ssh/id_rsa.pub" ] ; then \
	mkdir -p /home/xpfan/.ssh ; \
	cd /home/xpfan/.ssh && ssh-keygen -t rsa -C xfan@qti.qualcomm.com ; \
	cd /home/xpfan/.ssh && ssh-add id_rsa ; \
	echo "please use qualcomm user id as your ssh user name" ; \
	echo "private key was put on : /home/xpfan/.ssh/id_rsa" ; \
	echo "public key was put on : /home/xpfan/.ssh/id_rsa.pub" ; \
	echo "upload public key to http://qca-git01.qualcomm.com" ; \
	echo "set Preferred Email to xfan@qti.qualcomm.com" ; \
	echo "use following command to test ssh access" ; \
	echo "ssh -p 29418 xfan@qca-git01.qualcomm.com" ; \
	fi

setup_wireshark :
	sudo apt-get install wireshark
	sudo dpkg-reconfigure wireshark-common
	sudo usermod -a -G wireshark xpfan
	gnome-session-quit --logout --no-prompt

install_xpfan_terminal :
	@$(CUR_DIR)/mk.sh $@

setup_linux_environment : setup_tftp setup_ssh setup_wireshark install_xpfan_terminal
	mkdir -p /home/xpfan/bin
	sudo apt-get install minicom
	sudo usermod -a -G dialout xpfan
	sudo apt-get install filezilla
	sudo apt-get install freemind

setup_build_env :
	sudo apt-get install libreadline5 libreadline6 libreadline6-dev
	sudo apt-get install build-essential
	sudo apt-get install libncurses5 libncurses5-dev
	sudo apt-get install binutils
	sudo apt-get install flex bison
	sudo apt-get install gettext
	sudo apt-get install zlib1g zlib1g-dev
	sudo apt-get install libc6 libc6-dev
	sudo apt-get install subversion git git-core
	sudo apt-get install gawk
	sudo apt-get install patch
	sudo apt-get install sharutils
	sudo apt-get install curl
	sudo apt-get install perl libxml-parser-perl
	sudo apt-get install python python-yaml
	sudo apt-get install libx11-dev
	sudo apt-get install libacl1 libacl1-dev
	sudo apt-get install openssl libssl-dev

setup_tftp :
	sudo apt-get install tftpd
	sudo apt-get install xinetd
	mkdir -p /home/xpfan/test/tftpboot
	chmod a+w /home/xpfan/test/tftpboot
	sudo cp -f $(CUR_DIR)/ubuntu_env/tftp_cfg /etc/xinetd.d/tftp
	sudo service xinetd restart

install_git_repo_p4 :
	@$(CUR_DIR)/mk.sh $@

download_ruby :
	@$(CUR_DIR)/mk.sh $@

build_ruby : download_ruby setup_build_env
	@$(CUR_DIR)/mk.sh $@

install_gem :
	@$(CUR_DIR)/mk.sh $@

install_gems :
	sudo apt-get install libsqlite3-dev
	sudo gem install sqlite3-ruby

install_ruby : build_ruby install_gem install_gems

install_qsdk_2_0 :
	@$(CUR_DIR)/mk.sh $@

install_l2tp_server :
	@$(CUR_DIR)/mk.sh $@

install_kernel_code :
	@$(CUR_DIR)/mk.sh $@

create_qsdk_tarball :
	tar -czf /home/xpfan/source_code/p4_src/xpfan_p4_src/depot/sw/branches/qsdk-latest.tar.gz -T $(CUR_DIR)/ubuntu_env/qsdk.include -X $(CUR_DIR)/ubuntu_env/qsdk.exclude
