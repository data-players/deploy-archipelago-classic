DC= docker-compose
path-cron = $(shell pwd)/compact-cron.sh
path-cron-prod = $(shell pwd)/compact-cron-prod.sh
prod= docker-compose -f docker-compose-prod.yaml
dockerfile= docker-compose -f docker-compose-prod.yaml

start: 
	$(DC) up -d

stop: 
	$(DC) down

logs:
	$(DC) logs -f

logs-prod:
	$(prod) logs -f

start-prod: 
	$(prod) up -d

stop-prod: 
	$(prod) down

start-dockerfile: 
	$(dockerfile) up -d

stop-dockerfile: 
	$(dockerfile) down

logs-dockerfile:
	$(dockerfile) logs -f

compact: 
	$(DC) down && $(DC) up fuseki_compact && $(DC) up -d

compact-prod:
 	$(prod) down && $(prod) up fuseki_compact && $(prod) up -d

compact-dockerfile:
 	$(dockerfile) down && $(dockerfile) up fuseki_compact && $(dockerfile) up -d

set-compact-cron: 
	(crontab -l 2>/dev/null; echo "0 4 * * * $(path-cron) >> /tmp/cronlog.txt") | crontab -

set-compact-cron-prod: 
	(crontab -l 2>/dev/null; echo "0 4 * * * $(path-cron-prod) >> /tmp/cronlog.txt") | crontab -

prune-data:
	sudo rm -rf ./data