class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.string :role
      t.boolean :status
      t.string :confirm_token
      t.timestamps
    end
  end
end
