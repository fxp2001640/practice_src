
define __print_shinfo
	if $argc != 1
		printf "Invalid share info\n"
	else
		set $__ssi=(struct skb_shared_info *)$arg0
		p *$__ssi
	end
end

define print_skb
	if $argc != 1
		printf "Invalid address\n"
	else
		set $__skb=(struct sk_buff *)$arg0
		p *$__skb
		__print_shinfo $__skb->end
	end
end

define print_netdev
	if $argc != 1
		printf "Invalid address\n"
	else
		set $__dev=(struct net_device *)$arg0
		p *$__dev
	end
end


define ps
	set $task=&init_task
	set $root=(struct list_head*)&($task->tasks)
	set $offset=(char*)$root - (char*)$task
	set $vsz = $task->mm->total_vm*4
	if  $vsz == 1973342432
		set $vsz = 0
	end

	printf "pid\tvsz\tcommand\n"
	printf "%d\t%d\t%s\n", $task->pid, $vsz, $task->comm
	set $next=$root->next

	while $next != $root
		set $task = (struct task_struct*)((char*)$next - $offset)
		set $vsz = $task->mm->total_vm*4
		if  $vsz == 1973342432
			set $vsz = 0
		end
		printf "%d\t%d\t%s\n", $task->pid, $vsz, $task->comm
		set $next=$next->next
	end

end


define lsmod
	set $next = modules.next
	set $mod=(struct module*)0
	set $offset=(char*)&$mod->list

	printf "modules\n"
	while $next != &modules
		set $mod = (struct module*)((char*)$next - $offset)
		printf "%s\n", $mod->name
		set $next=$mod->list.next
	end
end



define ifconfig
	set $head = &init_net.dev_base_head
	set $dev=(struct net_device *)0
	set $offset=(char*)&$dev->dev_list
	set $next = $head->next

	while $next != $head
		set $dev = (struct net_device *)((char*)$next - $offset)
		printf "%s\tHWaddr:%02X:%02X:%02X:%02X:%02X:%02X\n", $dev->name, $dev->dev_addr[0], \
			$dev->dev_addr[1], $dev->dev_addr[2], $dev->dev_addr[3], $dev->dev_addr[4], $dev->dev_addr[5] 
		printf "\tifindex:%d MTU:%d\n", $dev->ifindex, $dev->mtu
		if $dev->ip_ptr && $dev->ip_ptr->ifa_list
			printf "\tinet addr:%d.%d.%d.%d\n", ((char*)&$dev->ip_ptr->ifa_list->ifa_address)[0], \
							 ((char*)&$dev->ip_ptr->ifa_list->ifa_address)[1], \
							 ((char*)&$dev->ip_ptr->ifa_list->ifa_address)[2], \
							 ((char*)&$dev->ip_ptr->ifa_list->ifa_address)[3],
		end
		printf "\n"
		set $next = $dev->dev_list->next
	end
end




define free
	set $totalram_pages = totalram_pages
	set $freeram = vm_stat[NR_FREE_PAGES]

	printf "Total: %d kB \n", $totalram_pages *4
	printf "Free: %d kB\n", (unsigned int)$freeram *4
end












