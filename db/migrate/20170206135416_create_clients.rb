class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :email
      t.string :contact
      t.string :skills
      t.string :address
      
      t.timestamps
    end
  end
end
