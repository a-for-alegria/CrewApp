class AddDobToCrew < ActiveRecord::Migration
  def change
  	add_column :crews, :dob, :string
  end
end
