class AddSpecToCrew < ActiveRecord::Migration
  def change
  	add_column :crews, :spec, :string
  end
end
