class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.text :cover_image_data
      t.string :name
    end
  end
end
