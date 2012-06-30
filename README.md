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
> git clone git@github.com:<your_name>/contributingcode.git contributingcode
> cd contributingcode
> bundle install;bundle package
> rake assets:precompile
> vmc push --runtime ruby19 --nostart 

