class CreateBoats < ActiveRecord::Migration[6.0]
  def change
    create_table :boats do |t|
      t.string :name
      t.string :location
      t.text :details
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
