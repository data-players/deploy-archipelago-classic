path-cron-prod = $(shell pwd)/compact-cron.sh
path-cron-dev = $(shell pwd)/compact-cron-dev.sh
dev= docker-compose -f docker-compose-dev.yaml
prod= docker-compose -f docker-compose-prod.yaml

build-prod:
	$(prod) build --no-cache

build-dev:
	$(dev) build --no-cache

build-dockerhub:
	docker-compose -f docker-compose-dockerhub.yaml build

start-prod: 
	$(prod) up -d

stop-prod: 
	$(prod) down

logs-prod:
	$(prod) logs -f

logs-dev:
	$(dev) logs -f

start-dev: 
	$(dev) up -d

stop-dev: 
	$(dev) down

compact-prod: 
	$(prod) down && $(prod) up fuseki_compact && $(prod) up -d

compact-dev:
	$(dev) down && $(dev) up fuseki_compact && $(dev) up -d

set-compact-cron-prod: 
	(crontab -l 2>/dev/null; echo "0 4 * * * $(path-cron-prod) >> /tmp/cronlog.txt") | crontab -

set-compact-cron-dev: 
	(crontab -l 2>/dev/null; echo "0 4 * * * $(path-cron-dev) >> /tmp/cronlog.txt") | crontab -

prune-data:
	sudo rm -rf ./data