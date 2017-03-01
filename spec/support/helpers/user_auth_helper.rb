module Support
  module UserAuth
    def sign_up(form_id, options)
      within "##{form_id}" do
        fill_in 'Email', with: options[:email]
        fill_passwords(options[:password])
        click_button 'Sign up'
      end
    end

    def sign_in(form_id, options)
      within "##{form_id}" do
        fill_in 'Email', with: options[:email]
        fill_in 'Password', with: options[:password]
        return yield if block_given?
        click_button 'Sign in'
      end
    end

    def get_confirm_email(email)
      open_email(email)
      current_email.click_link 'Confirm my account'
    end

    private

    def fill_passwords(password, type = 'password')
      fill_in type.capitalize, with: password
      fill_in 'Password confirmation', with: password
    end
  end
end
