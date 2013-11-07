class User < ActiveRecord::Base

  has_many :relationships
  has_many :entries, through: :relationships
  
end
