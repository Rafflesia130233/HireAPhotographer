class CreatePersonalinformations < ActiveRecord::Migration[5.0]
  def change
    create_table :personalinformations do |t|
      t.string :firstname
      t.string :lastname
      t.string :middlename
      t.date   :dateofbirth
      t.string :nationalid
      t.string :address
      t.string :state
      t.string :city
      t.string :country
      t.string :mobile
      t.string :phone
      t.string :secondaryEmail
      t.string :birthcountry
      t.string :summary
      t.belongs_to :photographer_user, index: true, foreign_key: true
      t.belongs_to :customer_user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
