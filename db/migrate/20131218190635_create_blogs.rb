class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :description
      t.references :author, index: true
      t.references :category, index: true

      t.timestamps
    end
  end
end
