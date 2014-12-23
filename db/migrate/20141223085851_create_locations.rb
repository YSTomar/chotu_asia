class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :city
      t.string :state
      t.string :country
      t.integer :user_id

      t.timestamps
    end
  end
end
