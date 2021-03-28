# frozen_string_literal: true

class Job < ApplicationRecord
  belongs_to :user, optional: true # creator of it
  belongs_to :company, optional: true
  has_many :applications
  has_many :users, through: :applications # people who have applied to jobs

  validates :title, :url, :description, presence: true

  accepts_nested_attributes_for :company

  # def check_for_duplicate
  #   # if there is already a job with that title and company throw an error

  #   if Job.find_by(title: title, company_id: company_id)
  #     errors.add(:title, 'has already been added for that brand')
  #   end
  # end
end
