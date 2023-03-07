class ChangeTypetoStatusinStreams < ActiveRecord::Migration[7.0]
  def change
    rename_column :streams, :type, :status
  end
end
