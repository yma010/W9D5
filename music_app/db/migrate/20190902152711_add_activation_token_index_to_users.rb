class AddActivationTokenIndexToUsers < ActiveRecord::Migration[6.0]
  def change
    add_index :users, :activation_token, unique: true
  end
end
