# Deploy-archipelago-classic

If you need to deploye a classic archipelago with no/low modification, this is the good place to be.
However, if you want to custom your own archipelago use this repos https://github.com/data-players/deploy-archipelago-custom

### Introduction

First make sur you get docker and docker-compose install on your server.
Make sure you have an usable domain name, then create 3 sub-domain for middleware, frontend, and authentification (Exemple data.myDomain.com, myDomain.com and login.myDomain.com)
Of course you need a server working with linux.

### 1 Fork the Deploye repo

Fork this project to get your own version and work on it.

#### Local test

You can test localy on your device by using the .dev docker-compose : 
```
docker-compose -f docker-compose.dev.yaml up
```
Frontend on http://localhost:4000/
Middleware on http://localhost:3000/
Fuseki database on http://localhost:3030 (user: admin, password : admin)
keycloak on http://localhost:8080 (Keycloak is a custom OIDC)
You will get an error when creating some organisation :
```
index.js:209 Error: @semapps/geo-components : No access token in mapbox configuration
```
This is because MapBox Access Token is not define in the docker-compose file. This is not really a problem for local testing.

### 2 Deploying on internet

Some variables in the docker-compose file are default values. You need to replace them with yours to make it works.
- line 18 myEmail@myemail.fr
- line 39 MyJenaPassword
- line 56 MyJenaPassword
- line 57 https://data.myDomain.com/ (middleware URL)
- line 67 data.myDomain.com (middleware domain name)
- line 76 https://data.myDomain.com/ (middleware URL)
- line 77 MyMapBoxToken (obtain an access token : https://docs.mapbox.com/help/getting-started/access-tokens/)
- line 88 myDomain.com (Your domain name)
- line 98 https://login.myDomain.com/auth (Login URL)
- line 96 myKeycloakPassword (To access OIDC amdin page)
- line 115 login.mydomain.com (Login domain name)

Of course you have to set up your domain name and sub domain name in your domain provider to make it works !

### 3 Launch your archipelago

Launch your app by making a 

```
docker-compose up -d
```

If you need to force dockers to restart add : --force-recreate

Check in your favorite browser if it's work.

Before testing your new app, you must configurate your OIDC to autorize connexion from your domain name "data".
Go to https://login.mydomain.com/auth and click on administration console. Connect with admin and "myKeycloakPassword".
On the left panel, click on Clients, then semapps as client ID.
If you scroll down, you must see a line "Valid Redirect URIs. Add your middleware address + "/*" (exemple : https://data.mydomain.com/*)

### 4 Minor change on Archipelago

If you want minor frontend change you can follow this step. Exemples : App Title, App Bar Color, Tab title and favicon.
Use the addOn directory in the repo to replace logo192/512.png, App.js, index.html and favicon.ico.
logo192.png : App Bar Logo, change it by your own logo (same name).
logo512.png : Ressource Logo, change it by your own (same name).
App.js : App Bar title, replace "MyArchipelago" line 23.
index.html : tab bar title, replace "MyArchipelago" line 18.
favicon.ico : tab bar icon, replace the file by your own (same name).

You can change the theme by owervriting customTheme.js, if you just need to change the App Bar color, replace css color "#28ccfb" line 8 by your selected color.

You can easily change other file and custom your archipelago from this directory. But if you begin to change everithing, maybe you need a custom deploye. More optimised.

Of course you can also change middleware files by adding them into the addOn/middlewaredirectory. Same advise as frontend, rememeber that if you need more than simple change, you probably need a custom archipelago.

##### Restart
Don't forget to restart
```
docker-compose up -d --force-recreate
```