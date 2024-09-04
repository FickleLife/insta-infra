# Stand up your own open source data platform, with credit to https://github.com/data-catering/insta-infra 
# Apache 2.0 licence



# Install Docker Engine for Linux (pref Ubuntu)




# Include path
PATH := /usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# Stand up all Apache services in Docker
up:
	AIRFLOW_UID=$(shell id -u) HADOOP_HOME=./data/hadoop ./run.sh neo4j airflow flink jupyter kafka minio zookeeper spark hadoop hive

#bring all containers down
down:
	./run.sh -d


#list all services that can be launched
list:
	./run.sh list

# Airflow requires at lease 4GB memory, preferably 8. Use the below to see how much memory is allocated to Docker
resources:
	docker info | grep -i "total memory"

# see what service is consuming memory
stats:
	docker stats 

#what docker containers are running
containers:
	docker container ls
	