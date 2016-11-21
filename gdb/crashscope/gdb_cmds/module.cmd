
set logging file log/module.log
set logging on
set $next = modules.next
while $next != &modules
	set $mod = (struct module*)((char*)$next - 4)
	printf "module: %s @0x%x\n", $mod->name, $mod
	printf "=====================================\n"
	printf "\tcore address: 0x%x+0x%x\n", $mod->module_core, $mod->core_text_size
	printf "\n"
	set $next=$mod->list.next
end

set logging off



