
set logging file log/task.log
set logging on


define show_task
	set $task=$arg0
	printf "=====================================\n"
	printf "task %s pid %d\n", $task->comm, $task->pid
	printf "state: %d vm: %dk\n", $task->state, $task->mm->total_vm*4

	printf "\n"
end

define show_tasks
	set $task=$arg0
	set $root=(struct list_head*)&($task->tasks)
	set $offset=(char*)$root - (char*)$task

	show_task $task
	set $next=$root->next
	while $next != $root
		set $next_task = (struct task_struct*)((char*)$next - $offset)
		show_task $next_task
		set $next=$next->next
	end

end


show_tasks &init_task

set logging off



