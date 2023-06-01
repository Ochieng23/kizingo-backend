class RemoveEmailFromAdmins < ActiveRecord::Migration[7.0]
  def change
    remove_column :admins, :email, :string
  end
end
