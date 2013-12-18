class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :description
      t.references :author, index: true
      t.integer :rating
      t.references :blog, index: true

      t.timestamps
    end
  end
end
