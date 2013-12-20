class AddRatingToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :rating, :float
  end
end
