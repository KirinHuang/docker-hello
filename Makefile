build:
	docker build -t kirinhuang/tomcat . 

run:
	docker run -d --name tomcat -p 8888:8080 kirinhuang/tomcat

runC:
	docker attach tomcat
cleanC:
	docker ps -a | awk 'NR>1 {printf "%s ", $$1}' | xargs docker rm 
