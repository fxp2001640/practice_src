
set logging file log/slab.log
set logging on


define show_kmem
	set $kmem=$arg0

	set $kmem_node=(struct kmem_cache_node*)$kmem->node[0]


	printf "=====================================\n"
	printf "name: %s  size: %d\n", $kmem->name, $kmem->size
	p *$kmem
	p *$kmem_node

	printf "\n"
end

define show_slabs
	set $head=$arg0
	set $next=$head->next
	set $zero_struct=(struct kmem_cache*)0x0
	set $offset=(int)&($zero_struct->list)

	while $next != $head
		set $next_kmem = (struct kmem_cache*)((char*)$next - $offset)
		show_kmem $next_kmem
		set $next=$next->next
	end

end


show_slabs &slab_caches

set logging off



