
![logo](https://github.com/mhs/redcross-trackr/wiki/images/redcross-logo.png)

Red Cross - Resource Tracking
===================================

The Red Cross Resource Tracking application, or **redcross-trackr** is a Ruby on Rails Web Application aimed to help the American Red Cross create and maintain relevant and accurate records on the whereabouts of their organizations resources.

Resources
------------------------------------
As a member of this project, you should have access to the following resources.

+ [**GitHub** : https://github.com/mhs/redcross-trackr](https://github.com/mhs/redcross-trackr)
+ [**GitHub Wiki** : https://github.com/mhs/redcross-trackr/wiki](https://github.com/mhs/redcross-trackr/wiki/_pages)
+ + NEW! [**User Interface Map**](https://github.com/mhs/redcross-trackr/wiki/User-Interface-Map)
+ + NEW! [**Whiteboard Notes**](https://github.com/mhs/redcross-trackr/wiki/Whiteboard-Notes-01)
+ + [**Project Map**](https://github.com/mhs/redcross-trackr/wiki/Project-Map)
+ + [**Story Map**](https://github.com/mhs/redcross-trackr/wiki/Story-Map)
+ [**Pivotal Tracker** : https://www.pivotaltracker.com/projects/668609](https://www.pivotaltracker.com/projects/668609)


Default Users
-----------------------------------
The system has default users, created in development when you run `rake db:seeds`

**Admin User**
```
e-mail : admin@example.com
pass   : adminpassword
```

**Member User**
```
e-mail : member@example.com
pass   : memberpassword
```

How Resources (Items) Are Defined
-----------------------------------
**PLEASE READ** through the db/seeds.rb file **before** digging the project. The resources are all defined dynamically from data in the database, and the db/seeds.rb file will likely clarify 90% of any questions you might have about how these work.

Items are defined by classes with the word "Definition" in the name. An Item's Type and Fields are defined in this manner. An instance of an item is a class of the same name, without "definition" in the title.

For example, you might define an item by creating an ItemTypeDefition for "Fire extinguisher". The ItemTypeDefinition "Fire extinguisher" might have ItemFieldDefinitions of "Colour", "Brand", or "Purchase Date".

Then, when a user actually wants to record a fire extinguisher, they create a new Item (with an item_type of ItemTypeDefinition:"Fire extinguisher"). If their Item has a brand name of "First Alert", then the Item has_one ItemField of "First Alert", and belongs_to an ItemFieldDefinition of "Brand" from above.


How Resources (Items) Are Given or Lent
--------------------------------------
Items can't be simply "moved". All Items must be explicitly "Given" or "Lent".

**Given Items** are items a chapter never expects to receive back, and occur by setting both the items 'owner' and 'location'. For example, If I am Grand Rapids Chapter, and I want to give Kalamazoo 50 Fire extinguishers, I would find an Item that represents my Fire extinguishers, and set both its "owner" and "location" to the Kalamazoo chapter.

**Lent Items** are items that a chapter plans on getting back in the future, and occur by setting the items 'location', but ignoring its "owner". For example, If I am Grand Rapids Chapter, and I want to lend Kalamazoo my Fire Truck, I would find an Item that represents my Fire Truck, and set both its "location" to the Kalamazoo chapter. I would leave the "owner" field set to Grand Rapids, to represent the fact that this Fire Truck should eventually make its way back to me.




Installing Red Cross for Development
-----------------------------------
The guide will assume your using either a Mac OSX or Linux environment, and a compatible package manager (Something like [Homebrew](http://mxcl.github.com/homebrew/) for OSX, or APT for Linux). It also assumes, you have [RVM](https://rvm.io/rvm/install/), and [MySQL](http://dev.mysql.com/doc/refman/5.5/en//installing.html) set up locally.

```bash
# Clone this project from GitHub
git clone git@github.com:mhs/redcross-trackr.git
cd recross-trackr

# Install the proper version of Ruby (if RVM hasn't done this for you already)
rvm install ruby-1.9.3-p194
rvm reload

# Have Bundler install the required dependencies
gem install bundler
bundle

# Create the project databases
bundle exec rake db:create:all db:schema:load

# Seed some test data for development use (Optional)
bundle exec rake db:seed

# Start the server
bundle exec rails server -p 3001

# Open your Webbrowser
open http://localhost:3001
```




Running Tests
-----------------------------------
(TODO : Write this section.)



Deploying to Staging
-----------------------------------
Our staging server is hosted on Heroku :

```bash
# Add the remote for Heroku in your git config
git remote add heroku git@heroku.com:redcross-trackr.git

# Deploy local branch 'master' to staging on Heroku
git push heroku master

# Deploy local branch 'acceptance' to staging on Heroku
git push heroku acceptance:master
```


