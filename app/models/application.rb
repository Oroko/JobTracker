# frozen_string_literal: true

class Application < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :job, optional: true

  validates :date_of_application, :notes, presence: true

  validates :job, uniqueness: { scope: :user, message: 'has already been applied by you' } # checks that an application to a job is unique
end
