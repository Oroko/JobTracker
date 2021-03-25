class Job < ApplicationRecord 
  belongs_to :user #creator of it
  belongs_to :company 

  has_many :applications 
  has_many :users, through: :applications #people who have applied to jobs
end
