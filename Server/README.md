# README
## Project Sample Task App

This Ruby on Rails project is built using Ruby version 2.7.8 and Rails version 5.2.8, with PostgreSQL as the chosen database. The following instructions will guide you through the setup process and getting the application up and running.

### Prerequisites  

Before you begin, make sure you have the following installed on your machine:

*Ruby 2.7.8*  

*Rails 5.2.8*  

*PostgreSQL*  

### Installation
*Clone the Repository:*  

git clone 'https://github.com/shimroz1992/Rails-App.git' 

cd your-repo-name  

#### Install Dependencies:  

Run the following command to install the required gems:
Run the following command to create the PostgreSQL database:    

bundle install
### Database Setup
#### Create Database:  
rails db:create  

rails db:migrate  


Apply the database migrations:  

#### Start the Server:
rails s  
or  
rails server
     


The application will be accessible at http://localhost:3000 in your web browser.

### Additional Information
This application is configured to use PostgreSQL as the database. Ensure that your PostgreSQL server is running.
For any environment-specific configurations, check the config/database.yml file.
Feel free to explore the project and make any necessary customizations according to your requirements.

Happy coding! 🚀
