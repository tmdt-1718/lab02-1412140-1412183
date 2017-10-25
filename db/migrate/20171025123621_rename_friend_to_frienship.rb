class RenameFriendToFrienship < ActiveRecord::Migration[5.1]
  def self.up
    rename_table :friends, :friendships
  end
  def self.down
    rename_table :friends, :friendships
  end
end
