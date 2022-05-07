json.extract! friends_list, :id, :full_name, :about, :email, :phone, :twitter, :created_at, :updated_at
json.url friends_list_url(friends_list, format: :json)
