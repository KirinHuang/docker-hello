build:
	docker build -t kirinhuang/ss . 

run:
	docker run --name ss -it kirinhuang/ss

runC:
	docker exec -it ss /bin/bash
cleanC:
	docker ps -a | grep ss | awk '{print, $$1}' | xargs docker rm 
