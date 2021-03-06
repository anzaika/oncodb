json.array!(@diseases) do |disease|
  json.extract! disease, :id, :name, :alt_names, :source, :type, :pharmGkbID
  json.url disease_url(disease, format: :json)
end
