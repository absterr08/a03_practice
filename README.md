# README

just like the practice:

**NB: Run `bundle install` before you get started.**

Next, set up the database:

    ./setup_db.sh

**If you run into a permissions issue, try running `chmod +x ./setup_db.sh`**


Some movie-industry associations practice inspired by recent events. I didnt write specs but here's a list of the associations I defined. Solutions are in app/models/solutions. Im sure my solutions arent all 100% so let me know if you find something wrong or if you have any questions :)

#Actor#
castings
stunt_double
movies
co_stars
directors_worked_with
producers_worked_with

#Movie#
director
producer
castings
actors

#Casting#
actor
movie
director
producer

#Producer#
production_company
movies_produced
directors_worked_with
allegations
victims_of_allegations

#Director#
movies_directed
guild
allegations
victims_of_allegations

#Allegations#
accusee
accuser

#ProductionCompany#
producers
movies
actors
allegations_on_employees
victims_of_employees

#Guild#
directors
movies
actors
allegations_on_employees
victims_of_employees



