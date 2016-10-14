build:
	docker build -t kirinhuang/tomcat . 

run:
	docker run --name tomcat -it kirinhuang/tomcat /bin/bash

runC:
	docker attach tomcat
cleanC:
	docker ps -a | awk 'NR>1 {printf "%s ", $$1}' | xargs docker rm 
