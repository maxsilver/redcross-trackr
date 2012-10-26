
Red Cross - Resource Tracking
===================================

The Red Cross Resource Tracking application, or **redcross-trackr** is a Ruby on Rails Web Application aimed to help the American Red Cross create and maintain relevant and accurate records on the whereabouts of their organizations resources.

Resources
------------------------------------
As a member of this project, you should have access to the following resources.

+ [**GitHub** : https://github.com/mhs/redcross-trackr](https://github.com/mhs/redcross-trackr)
+ [**GitHub Wiki** : https://github.com/mhs/redcross-trackr/wiki](https://github.com/mhs/redcross-trackr/wiki)
+ [**Pivotal Tracker** : https://www.pivotaltracker.com/projects/668609](https://www.pivotaltracker.com/projects/668609)
+ [**Story Map** : https://github.com/mhs/redcross-trackr/wiki/Story-Map](https://github.com/mhs/redcross-trackr/wiki/Story-Map)




Installing Red Cross for Development
-----------------------------------
The guide will assume your using either a Mac OSX or Linux environment, and a compatible package manager (Something like [Homebrew](http://mxcl.github.com/homebrew/) for OSX, or APT for Linux). It also assumes, you have [RVM](https://rvm.io/rvm/install/), and [MySQL](http://dev.mysql.com/doc/refman/5.5/en//installing.html) set up locally.

* Clone this project from GitHub
> git clone git@github.com:mhs/redcross-trackr.git
> cd recross-trackr

* Install the proper version of Ruby (if RVM hasn't done this for you already)
> rvm install ruby-1.9.3-p194
> rvm reload

* Have Bundler install the required dependencies
> gem install bundler
> bundle

* Copy the default database configuration, and configure your database access (if needed)
> cp config/database.yml.example config/database.yml
> nano config/database.yml

* Create the project databases
> bundle exec rake db:create:all db:schema:load

* Start the server
> bundle exec rails server

* Open your Webbrowser
> open [http://localhost:3000](http://localhost:3000)





