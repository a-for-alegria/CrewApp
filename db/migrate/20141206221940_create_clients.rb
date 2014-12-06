class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :client_name
      t.string :client_secondname

      t.timestamps
    end
  end
end
