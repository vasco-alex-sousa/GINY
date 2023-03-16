class RemoveStartTimeAndAddStartDatetimeToStreams < ActiveRecord::Migration[7.0]
  def change
    remove_column :streams, :started_at, :time
    add_column :streams, :started_at, :datetime
  end
end
