class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.integer :package_id
      t.string :number
      t.string :authors
      t.string :website
      t.string :documentation
      t.integer :downloads, :default => 0
      t.string :packaged_file

      t.timestamps
    end
  end
end
