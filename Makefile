build:
	docker build -t kirinhuang/git . 

run:
	docker run --name git -it kirinhuang/git /bin/bash

runC:
	docker attach git
cleanC:
	docker ps -a | awk 'NR>1 {printf "%s ", $$1}' | xargs docker rm 
