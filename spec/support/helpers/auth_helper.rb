module Support
  module Auth
    def auth_request(user)
      sign_in user
      request.headers.merge!(user.create_new_auth_token)
    end
  end
end
