# frozen_string_literal: true

class Job < ApplicationRecord
  belongs_to :user, optional: true # creator of it
  belongs_to :company, optional: true
  has_many :applications
  has_many :users, through: :applications # people who have applied to jobs

  # accepts_nested_attributes_for :company

  def company_attributes=(attributes)
    Company.find_or_create_by(attributes) unless
    name.empty
  end
end
