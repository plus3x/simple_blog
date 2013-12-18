class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :description
      t.integer :rating
      t.belongs_to :author
      t.belongs_to :blog

      t.timestamps
    end
  end
end
