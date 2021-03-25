class CreateApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :applications do |t|
      t.date :date_of_application
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :job, null: false, foreign_key: true

      t.timestamps
    end
  end
end
