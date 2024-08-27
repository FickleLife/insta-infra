# Stand up your own open source data platform, with credit to https://github.com/data-catering/insta-infra 
# Apache 2.0 licence



# Install Docker Engine for Linux (pref Ubuntu)




# Include path
PATH := /usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# Stand up all Apache services in Docker
up:
	AIRFLOW_UID=$(shell id -u) ./run.sh neo4j airflow flink jupyter kafka minio zookeeper spark

down:
	./run.sh -d

list:
	./run.sh list

# Airflow requires at lease 4GB memory, preferably 8. Use the below to see how much memory is allocated to Docker
resources:
	docker info | grep -i "total memory"
# see what service is consuming memory
stats:
	docker stats 
	