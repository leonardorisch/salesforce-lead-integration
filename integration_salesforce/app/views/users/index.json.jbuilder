json.array!(@users) do |user|
  json.extract! user, :id, :name, :lastname, :email, :company, :jobtitle, :phone, :website
  json.url user_url(user, format: :json)
end
