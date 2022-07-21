DC= docker-compose
path-cron = $(shell pwd)/compact-cron.sh
path-cron-dev = $(shell pwd)/compact-cron-dev.sh
dev= docker-compose -f docker-compose-dev.yaml
dockerfile= docker-compose -f docker-compose-dev.yaml

build:
	$(DC) build --no-cache

build-dev:
	$(dev) build --no-cache

build-dockerhub:
	docker-compose -f docker-compose-dockerhub.yaml build

start: 
	$(DC) up -d

stop: 
	$(DC) down

logs:
	$(DC) logs -f

logs-dev:
	$(dev) logs -f

start-dev: 
	$(dev) up -d

stop-dev: 
	$(dev) down

start-dockerfile: 
	$(dockerfile) up -d

stop-dockerfile: 
	$(dockerfile) down

logs-dockerfile:
	$(dockerfile) logs -f

compact: 
	$(DC) down && $(DC) up fuseki_compact && $(DC) up -d

compact-dev:
	$(dev) down && $(dev) up fuseki_compact && $(dev) up -d

compact-dockerfile:
	$(dockerfile) down && $(dockerfile) up fuseki_compact && $(dockerfile) up -d

set-compact-cron: 
	(crontab -l 2>/dev/null; echo "0 4 * * * $(path-cron) >> /tmp/cronlog.txt") | crontab -

set-compact-cron-dev: 
	(crontab -l 2>/dev/null; echo "0 4 * * * $(path-cron-dev) >> /tmp/cronlog.txt") | crontab -

prune-data:
	sudo rm -rf ./data