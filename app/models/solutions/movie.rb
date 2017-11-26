class Movie < ApplicationRecord
  
  belongs_to :director,
    class_name: 'Director',
    foreign_key: :director_id,
    primary_key: :id
    
  belongs_to :producer,
    class_name: 'Producer',
    foreign_key: :producer_id,
    primary_key: :id
    
  has_many :castings,
    class_name: 'Casting',
    foreign_key: :movie_id,
    primary_key: :id
    
  has_many :actors,
    through: :castings,
    source: :actor
    

end

