include Support::UserAuth

feature 'Sign up', type: :feature, js: true do
  scenario "User haven't account" do
    visit '#!/sign_up'
    user_attrs = attributes_for(:user)
    sign_up 'new_user', user_attrs
    expect(page).to have_content 'Confirmation email sent to you'
  end

  scenario 'User use invalid email' do
    user = create :user
    visit '#!/sign_up'
    sign_up 'new_user', attributes_for(:user, email: user.email)
    expect(page).to have_content 'Email has already been taken'
  end

  scenario 'User has already authed' do
    user = create :user, :default_password
    password = attributes_for(:user, :default_password)[:password]
    visit '#!/sign_in'
    sign_in 'new_session', email: user.email, password: password
    visit '#!/sign_up'
    expect(page).to have_content 'You have already sined in'
  end
end
