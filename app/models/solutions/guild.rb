class Guild < ApplicationRecord
  
  has_many :directors,
    class_name: 'Director',
    foreign_key: :guild_id,
    primary_key: :id
    
  has_many :movies,
    through: :directors,
    source: :movies_directed

  has_many :actors,
    through: :movies,
    source: :actors
    
  has_many :allegations_on_employees,
    through: :directors,
    source: :allegations
    
  has_many :victims_of_employees,
    through: :allegations_on_employees,
    source: :accuser
  
  
end
