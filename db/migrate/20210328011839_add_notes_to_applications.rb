class AddNotesToApplications < ActiveRecord::Migration[6.1]
  def change
    add_column :applications, :notes, :string
  end
end
