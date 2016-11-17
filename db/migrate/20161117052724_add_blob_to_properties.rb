class AddBlobToProperties < ActiveRecord::Migration[5.0]
  def up
    add_column :properties,:image, :binary, :limit => 10.megabyte
  end
  def down
    remove_column :properties,:image
  end
end
