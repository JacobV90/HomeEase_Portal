class RemoveColumnsFromProperties < ActiveRecord::Migration[5.0]
  def change
    remove_column :properties, :remember_created_at, :datetime
    remove_column :properties, :sign_in_count, :integer
    remove_column :properties, :current_sign_in_at, :datetime
    remove_column :properties, :last_sign_in_at, :datetime
    remove_column :properties, :current_sign_in_ip, :string
    remove_column :properties, :last_sign_in_ip, :string
  end
end
