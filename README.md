# Task Mangement app
A simple Task Management application built with Ember.js for the frontend and Rails API for the backend.
## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.
### Prerequisites

You will need the following things properly installed on your computer:

* [Git](http://git-scm.com/)
* [Node.js 16 and above](http://nodejs.org/) (with NPM)
* [Ember CLI](http://www.ember-cli.com/)
* Ruby 2.7.8
* Rails 5.2.8
* PostgreSQL

### Installing

Clone the repository:

`git clone https://github.com/shimroz1992/task-app-combined.git`

#### 1) To run EmberJs app

*  Change directory to client
`cd client`

* Install the packages
`npm install`

* run the command 
`ember serve`
or
`npm start`

This should run app on http://localhost:4200

enter the the path `/todos`

then it should be like 

http://localhost:4200/todos

Now the app should be running with its UI.

## Further Reading / Useful Links

* [ember.js](https://emberjs.com/)
* [ember-cli](https://cli.emberjs.com/release/)
* Development Browser Extensions
  * [ember inspector for chrome](https://chrome.google.com/webstore/detail/ember-inspector/bmdblncegkenkacieihfhpjfppoconhi)
  * [ember inspector for firefox](https://addons.mozilla.org/en-US/firefox/addon/ember-inspector/)
-----

#### 2) To run Rails api

*  Change directory to server
`cd server`


#### Install Dependencies:  
Run the following command to install the required gems:
`bundle install`

### Database Setup
Run the following command to create the PostgreSQL database:    

* Create Database:  
`rails db:create`  

* Apply the database migrations:  
`rails db:migrate`  

#### Start the Server
* Run the following command
`rails s`  
or  
`rails server`

The application will be accessible at http://localhost:3000 in your web browser.

### Additional Information
This application is configured to use PostgreSQL as the database. Ensure that your PostgreSQL server is running.
For any environment-specific configurations, check the config/database.yml file.
Feel free to explore the project and make any necessary customizations according to your requirements.

Happy coding! 🚀
