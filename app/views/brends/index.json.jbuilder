json.array!(@brends) do |brend|
  json.extract! brend, :title, :discription, :category_id
  json.url brend_url(brend, format: :json)
end
