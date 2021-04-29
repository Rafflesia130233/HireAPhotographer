json.extract! user, :id, :username, :email, :password, :role, :status, :confirm_token, :created_at, :updated_at
json.url user_url(user, format: :json)