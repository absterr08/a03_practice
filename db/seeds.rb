# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'byebug'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  Actor.delete_all
  Producer.delete_all
  Director.delete_all
  Movie.delete_all
  Casting.delete_all
  ProductionCompany.delete_all
  Guild.delete_all
  Allegation.delete_all
end


actors = ['Lupita Nyongo', 'Angelina Jolie', 'Gwyneth Paltrow', 'Katherine Kendall', 'Cara Delevingne', 'Lea Seydoux', 'Claire Forlani', 'Minka Kelly', 'Eva Green',
'Rose McGowan', 'Asia Argento', 'Mira Sorvino', 'Ambra Battilana Gutierrez', 'Gwyneth Paltrow', 'Rosanna Arquette', 'Angie Everhart', 'Louisette Geiss', 'Heather Graham', 'Ashley Judd', 'Uma Thurman', 'Lysette Anthony', 'Samuel L. Jackson', 'Lucy Liu', 'Darryl Hannah']

#source: https://www.avclub.com/an-incomplete-depressingly-long-list-of-celebrities-se-1819628519
some_weinstein_victims = ['Lupita Nyongo', 'Angelina Jolie', 'Gwyneth Paltrow', 'Katherine Kendall', 'Cara Delevingne', 'Lea Seydoux', 'Claire Forlani', 'Minka Kelly', 'Eva Green',
'Rose McGowan', 'Asia Argento', 'Mira Sorvino', 'Ambra Battilana Gutierrez', 'Gwyneth Paltrow', 'Rosanna Arquette', 'Angie Everhart', 'Louisette Geiss', 'Heather Graham', 'Ashley Judd', 'Lysette Anthony']

#couldn't figure out how to allow null vals for stunt_double, so here's a placeholder


actors.each do |name|
  Actor.create(name: name)
end

#create guild and production companies
dga = Guild.create(name: 'Directors Guild of America')
weinstein_co = ProductionCompany.create(name: 'Weinstein Co')
mirimax = ProductionCompany.create(name: 'Mirimax')

#create producers
mirimax_producer = Producer.create(name: "some producer", production_company_id: mirimax.id)
weinstein = Producer.create(name: "Harvey Weinstein", production_company_id: weinstein_co.id)
#some more accused producers. too lazy to look up their companies
['Brett Ratner', 'Louis C.K.'].each { |name| Producer.create(name: name) }

#create directors
Director.create(name: 'James Toback', guild_id: dga.id)
tarantino = Director.create(name: 'Quentin Tarantino', guild_id: dga.id)

#to create some allegations without named accusers
unnamed = Actor.create(name: 'unnamed')

5.times { Allegation.create(accuser_id: unnamed.id, accusee_id: Producer.find_by(name: 'Louis C.K.').id) }
6.times { Allegation.create(accuser_id: unnamed.id, accusee_id: Producer.find_by(name: 'Brett Ratner').id) }
38.times { Allegation.create(accuser_id: unnamed.id, accusee_id: Director.find_by(name: 'James Toback').id) }

#there's 20 on this list...
some_weinstein_victims.each do |name|
  actor = Actor.find_by(name: name)
  Allegation.create(accuser_id: actor.id, accusee_id: weinstein.id)
end
#...but he's at over 60 accusations so let's add 40 more
40.times { Allegation.create(accuser_id: unnamed.id, accusee_id: weinstein.id) }

#source: http://www.masslive.com/entertainment/index.ssf/2017/11/harvey_weinstein_fallout_list.html

#create some movies
pulp_fiction = Movie.create(title: "Pulp Fiction", producer_id: weinstein.id, director_id: tarantino.id)
kill_bill = Movie.create(title: "Kill Bill: Vol. 1", producer_id: mirimax_producer.id, director_id: tarantino.id)

#create a stunt_double
stunt_double = Actor.create(name: 'Sean Travolta')
Actor.create(name: 'John Travolta', stunt_double_id: stunt_double.id)

#create castings
['Uma Thurman', 'John Travolta', 'Samuel L. Jackson'].each do |name|
  actor = Actor.find_by(name: name)
  Casting.create(actor_id: actor.id, movie_id: pulp_fiction.id)
end

['Uma Thurman', 'Lucy Liu', 'Darryl Hannah'].each do |name|
  actor = Actor.find_by(name: name)
  Casting.create(actor_id: actor.id, movie_id: kill_bill.id)
end
