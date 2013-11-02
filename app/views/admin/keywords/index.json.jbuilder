json.array!(@keywords) do |keyword|
  json.extract! keyword, :type, :keyword, :reply_content
  json.url keyword_url(keyword, format: :json)
end
