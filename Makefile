# Variables
PROJECT_NAME:=sitespeed
container:=${container}
# Tag log variable definition
tag ?= *
all:;: '$(tag)'

help: ; @ \
	clear; \
	echo ""; \
	echo "Usage instructions:"; \
	echo ""; \
	echo 'make status: \t\t\t\t\t\t\tShow development environment'; \
	echo 'make clean: \t\t\t\t\t\t\tClean dangling volume and images from docker'; \
    echo 'make run: \t\t\t\t\t\t\tExecute command inside the container when it is running'; \
	echo "make help: \t\t\t\t\t\t\tHow to use make command";\
	echo "";

status: ; @\
	clear; \
	echo "[Status...]"; \
	echo "";\
	docker-compose -p ${PROJECT_NAME} ps

clean: ; @\
	clear; \
	echo "[Cleaning Dangling images...]"; \
	echo "";\
	docker images -q -f dangling=true | xargs docker rmi -f; \
	echo "";\
	echo "[Cleaning Dangling volumes...]"; \
	echo "";\
	docker volume ls -q -f dangling=true | xargs docker volume rm

run: ; @\
        clear; \
        echo "[Running project...]"; \
        echo ""; \
        docker-compose run --rm --no-deps sitespeed