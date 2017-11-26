class Actor < ApplicationRecord
  
  has_many :castings,
    class_name: 'Casting',
    foreign_key: :actor_id,
    primary_key: :id
    
  belongs_to :stunt_double, optional: true,
    class_name: 'Actor',
    foreign_key: :stunt_double_id,
    primary_key: :id
    
  has_many :movies,
    through: :castings,
    source: :movie
    
  has_many :co_stars,
    through: :movies,
    source: :actors
    
  has_many :directors_worked_with,
    through: :castings,
    source: :director
  
  has_many :producers_worked_with,
    through: :castings,
    source: :producer
  
end
