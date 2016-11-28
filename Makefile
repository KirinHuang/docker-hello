build:
	docker build -t kirinhuang/nodejs . 

run:
	docker run -d --name nodejs -it kirinhuang/nodejs 

runC:
	docker exec -it nodejs /bin/bash
cleanC:
	docker ps -a | grep nodejs | awk '{print $$1}' | xargs docker rm 
