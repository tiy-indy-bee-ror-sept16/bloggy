class AddsPasswordTokenToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :password_token, :string#, default: 0
  end
end
