build:
	docker build -t kirinhuang/nginx . 

run:
	docker run -d --name nginx -p 8080:80 -p 443:443 -it kirinhuang/nginx

runC:
	docker start nginx

bash:
	docker exec -it nginx /bin/bash
cleanC:
	docker ps -a | grep nginx | awk '{print $$1}' | xargs docker rm 
