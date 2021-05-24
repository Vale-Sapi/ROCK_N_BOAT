class CreateBoats < ActiveRecord::Migration[6.0]
  def change
    create_table :boats do |t|
      t.string :name
      t.string :location
      t.text :details
      t.integer :price

      t.timestamps
    end
  end
end
