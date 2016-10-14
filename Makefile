build:
	docker build -t kirinhuang/yarn . 

run:
	docker run --name yarn -it kirinhuang/yarn /bin/bash

runC:
	docker attach yarn
cleanC:
	docker ps -a | awk 'NR>1 {printf "%s ", $$1}' | xargs docker rm 
