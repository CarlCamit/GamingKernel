class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.decimal :price
      t.string :condition
      t.text :details
      t.string :charge_identifier
      t.references :game, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
