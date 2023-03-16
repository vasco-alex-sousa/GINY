class CreateStreams < ActiveRecord::Migration[7.0]
  def change
    create_table :streams do |t|
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.time :started_at
      t.string :language
      t.string :type
      t.integer :viewer_count
      t.integer :average_viewers
      t.integer :peak_viewers
      t.integer :number_of_chat_messages
      t.integer :unique_chatters
      t.integer :new_followers
      t.integer :new_subscriptions

      t.timestamps
    end
  end
end
