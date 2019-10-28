GraphiQL::Rails.config.headers['Authorization'] = -> (context) do
  username = context.params['username']
  return '' unless username.present?
  "Bearer token=#{User.find_by(username: username)&.create_token(false)}"
end
