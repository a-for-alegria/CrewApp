class AddBankcardToCrew < ActiveRecord::Migration
  def change
  	add_column :crews, :bank_card, :string
  end
end
