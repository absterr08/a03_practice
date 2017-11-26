class Casting < ApplicationRecord
  
  belongs_to :actor,
    class_name: 'Actor',
    foreign_key: :actor_id,
    primary_key: :id

  belongs_to :movie,
    class_name: 'Movie',
    foreign_key: :movie_id,
    primary_key: :id
    
  has_one :director,
    through: :movie,
    source: :director
  
  has_one :producer,
    through: :movie,
    source: :producer
  
end
