build:
	docker build -t kirinhuang/java . 

run:
	docker run --name java -it kirinhuang/java /bin/bash

runC:
	docker attach java
cleanC:
	docker ps -a | awk 'NR>1 {printf "%s ", $$1}' | xargs docker rm 
