
set logging file log/vmap.log
set logging on
set $next = vmap_area_list.next
set $vm_area=(struct vmap_area*)0x0
set $offset=(int)&($vm_area->list)

while $next != &vmap_area_list
	set $vmap = (struct vmap_area*)((char*)$next - $offset)
	printf "vm: 0x%x - 0x%x\n", $vmap->va_start, $vmap->va_end
	printf "=====================================\n"
	x/w $vmap->vm->caller
	printf "\n"
	set $next=$vmap->list.next
end

set logging off



