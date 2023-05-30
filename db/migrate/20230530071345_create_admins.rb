class CreateAdmins < ActiveRecord::Migration[7.0]
  def change
    create_table :admins do |t|
      t.string :avatar
      t.string :admin_code
      t.string :full_name
      t.string :email
      t.string :user_code

      t.timestamps
    end
  end
end
