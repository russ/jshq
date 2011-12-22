class AddLibraryToPackages < ActiveRecord::Migration
  def change
    add_column :packages, :library, :string
  end
end
