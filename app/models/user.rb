class User < ApplicationRecord
   
        validates :name, presence: true
        validates :surname, presence: true
        validates :mail, presence: true
        validates :password, presence: true
      
      
end 
