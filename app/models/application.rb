# frozen_string_literal: true

class Application < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :job, optional: true

  validates :date_of_application, :notes, presence: true
end
