class CreateClips < ActiveRecord::Migration[7.0]
  def change
    create_table :clips do |t|
      t.string :thumbnail_url
      t.references :stream, null: false, foreign_key: true
      t.string :title
      t.integer :view_count
      t.time :clip_date

      t.timestamps
    end
  end
end
