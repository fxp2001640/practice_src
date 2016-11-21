
set logging file log/module_load.sh
set logging on
set $next = modules.next
printf "#!/bin/sh\n"
printf "\n"

while $next != &modules
	set $mod = (struct module*)((char*)$next - 4)
	printf "if [ -f ${MODULE_PATH}/%s.o ]; then\n", $mod->name
	printf "\techo \"add-symbol-file ${MODULE_PATH}/%s.o 0x%x\"\n", $mod->name, $mod->module_core
	printf "fi\n"
	set $next=$mod->list.next
end

set logging off



