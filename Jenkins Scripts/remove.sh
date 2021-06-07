aws ecs list-tasks --cluster "epam-final" --output text --query 'taskArns[0]'

myClusterId="epam-final"
for i in $( aws ecs list-tasks --cluster $myClusterId --output text --query 'taskArns[*]' ); do
	aws ecs stop-task --cluster $myClusterId --task $i
done
