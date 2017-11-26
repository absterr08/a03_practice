class ProductionCompany < ApplicationRecord
  
  has_many :producers,
    class_name: 'Producer',
    foreign_key: :production_company_id,
    primary_key: :id
    
  has_many :movies,
    through: :producers,
    source: :movies_produced
    
  has_many :actors,
    through: :movies,
    source: :actors
    
  has_many :allegations_on_employees,
    through: :producers,
    source: :allegations
    
  has_many :victims_of_employees,
    through: :allegations_on_employees,
    source: :accuser
    
  
    
  
end
