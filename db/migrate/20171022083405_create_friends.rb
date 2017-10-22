class CreateFriends < ActiveRecord::Migration[5.1]
  def change
    create_table :friends do |t|
      t.integer :main_id
      t.integer :friend_id
      t.date :make_date

      t.timestamps
    end
  end
end
