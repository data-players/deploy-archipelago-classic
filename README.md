# Deploy-archipelago-classic

If you need to deploye a classic archipelago with no/low modification, this is the good place to be.
However, if you want to custom your own archipelago use this repos https://github.com/data-players/deploy-archipelago-custom

### introduction

First make sur you get docker and docker-compose install on your server.
Make sure you have an usable domain name, then create 2 sub-domain for middleware and frontend (Exemple data.myDomain.com and myDomain.com)
Of course you need a server working with linux.

### 1 Fork the Deploye repo

Fork this project to get your own version and work on it.

### 2 Change exemple variable

Some variables in the docker-compose file are default values. You need to replace them with yours to make it works.
- line 19 myEmail@myemail.fr
- line 40 MyJenaPassword
- line 57 MyJenaPassword
- line 58 https://data.myDomain.com/ (middleware URL)
- line 68 data.myDomain.com (middleware domain name)
- line 82 https://data.myDomain.com/ (middleware URL)
- line 83 MyMapBoxToken (obtain an access token : https://docs.mapbox.com/help/getting-started/access-tokens/)
- line 92 myDomain.com (Your domain name)

Of course you have to set up your domain name and sub domain name in your domain provider to make it works !

### 3 Launch your archipelago

Launch your app by making a 

```
docker-compose up -d
```

If you need to force dockers to restart add : --force-recreate

Now it's time to check your domain name in your faforite browser !
Grontalution !

### 4 Change your App bar color, App name and logo

If the only think you need to change is the app, logo and appBar color you don't need to create a custom archipelago.
Uncomment line 77 -> 80 in the docker-compose file 
Use the addOn directory in the repo to put your logo, App.js,index.html and favicon.ico (exemple here : https://github.com/data-players/deploy-archipelago-addon-exemple)

### Logo
Put your logo inside this directory and name it MyLogo.png (of course you can change the name in the docker-compose file if the extension isn't the good one)

### Color and Title
Create a new file name App.js in the public directory
- line 21 change the title app name to get a new titlein your app bar
- line 16 add this line theme.palette.primary.main = "select your css color"

### Tab title and icon (New)
Now you can change tab title and icon by adding 2 file in the public directory. You can look in the git exemple above.
Add your favicon in the directory and rename it myFavicon.ico
Add your index.html and rename it myIndex.html (take the one in exemple if it's easier) and juste replace YourTabTitle line 18 by your title.

Save and enjoy !
