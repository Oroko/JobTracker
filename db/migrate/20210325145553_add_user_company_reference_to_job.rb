class AddUserCompanyReferenceToJob < ActiveRecord::Migration[6.1]
  def change
    add_column :jobs, :company_id, :integer
    add_index :jobs, :company_id
    add_column :jobs, :user_id, :integer
    add_index :jobs, :user_id
  end
end
