####Overview
Contributing code app was primarily built for the #contributingcode event with the functionality for participants 
to register for an event, and later create or join teams. The app has the standard sections like venue, FAQ's,etc, to be 
displayed. Additionally email notifications for various actions like registration confirmation, join team,etc were implemented.
This app is very generic and can be used for other events by just changing the content and css.

####Requirements
A login system. 
Ability for users to create teams or join existing ones. 
The ability of the owner to edit the team and others to leave a team if they wanted to. 
Sections to post various information. 

####Prerequesites 
* Create a Cloud Foundry account to deploy your app [here](http://www.cloudfoundry.com/)
* Create an application on Github and obtain the client id and client sceret to use for OAuth [here](https://github.com/settings/applications)
* Create a bucket on mongolab to store the images in Mongo GridFs [here](https://mongolab.com/home)
* Create a SendGrid account and obtain you credentials for email delivery [here](http://sendgrid.com/)

#####Deploying the app on Cloud Foundry
Fork the project and then 
```ruby
git clone git@github.com:<your_name>/contributingcode.git contributingcode
cd contributingcode
bundle install;bundle package
rake assets:precompile
```

To start the Core app 
```ruby
$ vmc push --runtime ruby19 --nostart
Would you like to deploy from the current directory? [Yn]: y
Application Name: contributingcode
Detected a Rails Application, is this correct? [Yn]: y
Application Deployed URL [contributingcod.cloudfoundry.com]: y
Memory reservation (128M, 256M, 512M, 1G, 2G) [256M]: 256M
How many instances? [1]: 1
Create services to bind to 'contributingcode'? [yN]: y
1: mongodb
2: mysql
3: postgresql
4: rabbitmq
5: redis
What kind of service?: 2
Specify the name of the service [mysql-3e25d]: mydb
Create another? [yN]: y
1: mongodb
2: mysql
3: postgresql
4: rabbitmq
5: redis
What kind of service?: 5
Specify the name of the service [redis-2a4c2]: myque
Create another? [yN]: n
Would you like to save this configuration? [yN]: y
Manifest written to manifest.yml.
Creating Application: OK
Creating Service [mydb]: OK
Binding Service [mydb]: OK
Creating Service [myque]: OK
Binding Service [myque]: OK
Uploading Application:
  Checking for available resources: OK
  Processing resources: OK
  Packing application: OK
  Uploading (558K): OK   
Push Status: OK
```

######To start the worker app 
Rename the manifest file if you have creted 
```ruby
vmc push ccworker  --nostart
Would you like to deploy from the current directory? [Yn]: y
Detected a Rails Application, is this correct? [Yn]: n
1: Rails
2: Spring
3: Grails
4: Lift
5: JavaWeb
6: Standalone
7: Sinatra
8: Node
9: Rack
10: Play
Select Application Type: 6
Selected Standalone Application
1: java
2: node
3: node06
4: ruby18
5: ruby19
Select Runtime [ruby18]: 5
Selected ruby19
Start Command: bundle exec rake VERBOSE=true QUEUE="*" resque:work    
Application Deployed URL [None]: 
Memory reservation (128M, 256M, 512M, 1G, 2G) [128M]: 128M
How many instances? [1]: 1
Bind existing services to 'ccworker'? [yN]: y
1: mydb
2: myque
Which one?: 1
Bind another? [yN]: y
1: mydb
2: myque
Which one?: 2
Create services to bind to 'ccworke'? [yN]: n
Would you like to save this configuration? [yN]: y
Manifest written to manifest.yml.
Creating Application: OK
Binding Service [mydb]: OK
Binding Service [myque]: OK
Uploading Application:
  Checking for available resources: OK
  Processing resources: OK
  Packing application: OK
  Uploading (39K): OK   
Push Status: OK
```
#####To configure
Set the Github and  Mongolab credentials for core app
```ruby
vmc env-add contributingcode github_client_id=  'github client id'
vmc env-add contributingcode github_client_secret= 'github client secret'
vmc env-add contributingcode mongodb_host= 'host'
vmc env-add contributingcode mongodb_port= 'port'
vmc env-add contributingcode mongodb_username= 'username'
vmc env-add contributingcode mongodb_password= 'password'
vmc env-add contributingcode mongodb_db='db name'
```

Similarly set the environmental variables to the worker app too. Set the sendgrid credentiols in addition to the 
Mongolab and Github credentials
```ruby
vmc env-add <worker appname> github_client_id=  'github client id'
vmc env-add <worker appname> github_client_secret= 'github client secret'
vmc env-add <worker appname> mongodb_host= 'host'
vmc env-add <worker appname> mongodb_port= 'port'
vmc env-add <worker appname> mongodb_username= 'username'
vmc env-add <worker appname> mongodb_password= 'password'
vmc env-add <worker appname> mongodb_db='db name'
vmc env-add <worker appname> sendgrid_username='sendgrid username'
vmc env-add <worker appname> sendgrid_password='sendgrid_password'
```

While running on localhost set mysql_pwd as follows
```ruby 
export mysql_pwd='mysql password'
```

Finally to start your app on cloudfoundry 
```ruby 
app start <core app name>
app start <worker app name>
```




