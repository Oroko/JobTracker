# frozen_string_literal: true

class Job < ApplicationRecord
  belongs_to :user, optional: true # creator of it
  belongs_to :company, optional: true
  has_many :applications, dependent: :destroy
  has_many :users, through: :applications # people who have applied to jobs

  validates :title, :url, :description, presence: true 

  validates :title, uniqueness: { scope: :user, message: 'has already been added by you' } # checks that a job is unique

  accepts_nested_attributes_for :company 

  # def check_for_duplicate
  #   # if there is already a job with that title and company throw an error

  #   if Job.find_by(title: title, company_id: company_id)
  #     errors.add(:title, 'has already been added for that brand')
  #   end
  # end 


   scope :find_by_title_or_description, ->(params) { where("title LIKE '%#{params.title}%' OR description LIKE '%#{params.description}%' " ) }
   scope :find_by_title, ->(params) { where("title LIKE '%#{params[:title]}%'  " ) }
   scope :find_by_description, ->(params) { where("description LIKE '%#{params[:description]}%' " ) }

   # where("title LIKE '%#{params.title}%' OR description LIKE '%#{params.description}%' " )


end
