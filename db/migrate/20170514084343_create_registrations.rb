lass CreateRegistrations < ActiveRecord::Migration[5.0]
  def change
    create_table :registrations do |t|
      t.string :name
      t.integer :phone
      t.string :email
      t.string :password_digest
      t.string :city
      t.string :area
      t.string :typeofroom
      t.string :onebhk
      t.string :twobhk
      t.string :threebhk

      t.timestamps
    end
  end
end
