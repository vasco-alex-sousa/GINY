class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :box_art_url
      t.integer :rank
      t.integer :average_viewers
      t.integer :peak_viewers
      t.date :peak_viewers_date

      t.timestamps
    end
  end
end
