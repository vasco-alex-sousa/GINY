class AddFollowersToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :total_followers, :integer
  end
end
