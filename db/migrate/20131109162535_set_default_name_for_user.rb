class SetDefaultNameForUser < ActiveRecord::Migration
  def up
  	change_column :users, :name, :string, default: "Anonym"
  end
  def down
  	change_column :users, :name, :string, default: ""
  end
end
