class CreateSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :searches do |t|
      t.string :keywords
      t.string :name
      t.string :breed
      t.string :animal_type
      t.bigint :phone_number
      t.integer :age

      t.timestamps
    end
  end
end
