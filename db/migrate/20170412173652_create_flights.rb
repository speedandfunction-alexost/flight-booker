class CreateFlights < ActiveRecord::Migration[5.0]
  def change
    create_table :flights do |t|
      t.integer :from_id
      t.integer :to_id
      t.date :dep

      t.timestamps
    end
  end
end
