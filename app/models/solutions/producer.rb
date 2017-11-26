class Producer < ApplicationRecord
  
  belongs_to :production_company, optional: true,
    class_name: 'ProductionCompany',
    foreign_key: :production_company_id,
    primary_key: :id
    
  has_many :movies_produced,
    class_name: 'Movie',
    foreign_key: :producer_id,
    primary_key: :id
    
  has_many :directors_worked_with,
    through: :movies_produced,
    source: :director
    
  has_many :allegations,
    class_name: 'Allegation',
    foreign_key: :accusee_id,
    primary_key: :id
    
  has_many :victims_of_allegations,
    through: :allegations,
    source: :accuser
  
end
