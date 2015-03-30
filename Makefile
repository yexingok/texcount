CONTAINERNAME=texcount
USER=$(shell whoami)

build:
	docker build -t $(USER)/$(CONTAINERNAME) .
rebuild:
	docker build --no-cache -t $(USER)/$(CONTAINERNAME) .
debug:
	docker exec -it $(CONTAINERNAME) /bin/bash
logs:
	docker exec -it $(CONTAINERNAME) tail -f /var/log/httpd/error_log /var/log/httpd/access_log
ip:
	docker inspect --format '{{ .NetworkSettings.IPAddress }}' $(CONTAINERNAME)
run:
	docker run -d --name $(CONTAINERNAME) -p 80:80  $(USER)/$(CONTAINERNAME) 
start: 
	docker start $(CONTAINERNAME)
stop:
	docker stop  $(CONTAINERNAME)
destroy:
	docker stop $(CONTAINERNAME) 
	docker rm $(CONTAINERNAME) 
