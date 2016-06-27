class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :posts, :notes, :username
  end
end
