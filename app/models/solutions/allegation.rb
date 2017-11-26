class Allegation < ApplicationRecord
  
  
  #I got lazy so i only defined accusee on Producers.
  #because of this, any director with the same ID as an 
  #accused producer will share their allegations
  #(sorry Quentin)

  belongs_to :accusee
    class_name: 'Producer',
    foreign_key: :accusee_id,
    primary_key: :id
    
    
  #defining accusee on directors might look something like this idk.
  #it's getting pretty repetetive, so it probably would have been better to 
  #have producers, directors, and actors inherit from a class or share a class or something,
  #so that we wouldnt have to define #accused on all the different classes
  
  # belongs_to :accused_director,
  #   class_name: 'Director',
  #   foreign_key: :accusee_id,
  #   primary_key: :id
  
  belongs_to :accuser,
    class_name: 'Actor',
    foreign_key: :accuser_id,
    primary_key: :id