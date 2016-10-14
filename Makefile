build:
	docker build -t kirinhuang/hello . 

run:
	docker run --name hello -it kirinhuang/hello /bin/bash

runC:
	docker attach hello
cleanC:
	docker ps -a | awk 'NR>1 {printf "%s ", $$1}' | xargs docker rm 
