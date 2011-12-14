class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.integer :user_id
      t.string :name
      t.string :slug
      t.text :summary
      t.text :description
      t.integer :downloads, :default => 0
      t.timestamps
    end

    add_index :packages, :slug, :unique => true
  end
end
