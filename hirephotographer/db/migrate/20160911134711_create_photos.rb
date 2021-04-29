class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :location
      t.string :description
      t.string :customer
      t.string :url
      t.blob :data
      t.string :camerainfo
      t.date :date
      t.string :remark
      t.belongs_to :profile, index: true, foreign_key: true
      t.timestamps
    end
  end
end
