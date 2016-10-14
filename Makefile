build:
	docker build -t kirinhuang/nodejs . 

run:
	docker run --name nodejs -it kirinhuang/nodejs /bin/bash

runC:
	docker attach nodejs
cleanC:
	docker ps -a | awk 'NR>1 {printf "%s ", $$1}' | xargs docker rm 
