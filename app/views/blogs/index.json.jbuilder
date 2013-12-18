json.array!(@blogs) do |blog|
  json.extract! blog, :id, :title, :description, :author_id, :category_id
  json.url blog_url(blog, format: :json)
end
