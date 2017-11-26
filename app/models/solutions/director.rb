class Director < ApplicationRecord
  
  belongs_to :guild,
    class_name: 'Guild',
    foreign_key: :guild_id,
    primary_key: :id
    
  has_many :movies_directed,
    class_name: 'Movie',
    foreign_key: :director_id,
    primary_key: :id
    
  has_many :allegations,
    class_name: 'Allegation',
    foreign_key: :accusee_id,
    primary_key: :id
    
  has_many :victims_of_allegations,
    through: :allegations,
    source: :accuser
    
  
  
end
