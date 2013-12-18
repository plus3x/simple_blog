json.array!(@comments) do |comment|
  json.extract! comment, :id, :description, :author_id, :rating, :blog_id
  json.url comment_url(comment, format: :json)
end
