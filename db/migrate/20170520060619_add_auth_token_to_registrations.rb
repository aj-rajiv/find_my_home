class AddAuthTokenToRegistrations < ActiveRecord::Migration[5.0]
  def change
    add_column :registrations, :auth_token, :string
  end
end
