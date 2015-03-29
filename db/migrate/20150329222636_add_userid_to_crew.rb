class AddUseridToCrew < ActiveRecord::Migration
  def change
  	add_column :crews, :user_id, :integer
  end
end
