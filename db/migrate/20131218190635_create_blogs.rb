class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :description
      t.belongs_to :author
      t.belongs_to :category

      t.timestamps
    end
  end
end
