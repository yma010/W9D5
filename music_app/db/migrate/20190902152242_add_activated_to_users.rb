class AddActivatedToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :activated, :boolean, null: false, default: false
    add_column :users, :activation_token, :string ,null: false
  end
end
