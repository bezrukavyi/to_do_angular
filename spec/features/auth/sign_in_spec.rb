include Support::UserAuth

feature 'Sign in', type: :feature, js: true do
  scenario 'When user success sign in' do
    user = create :user
    visit '#!/sign_in'
    sign_in('new_session', email: user.email, password: user.password)
    expect(page).to have_content 'Success singed in'
    expect(page).to have_content 'Sign out'
  end

  scenario 'User has already signed in' do
    user = create :user, :default_password
    password = attributes_for(:user, :default_password)[:password]
    visit '#!/sign_in'
    sign_in 'new_session', email: user.email, password: password
    sleep 2
    visit '#!/sign_in'
    expect(page).to have_content 'You have already sined in'
  end

  scenario 'When user write invalid data' do
    visit '#!/sign_in'
    sign_in('new_session', email: 'rspec555@gmail.com', password: 'rspec555')
    expect(page).to have_content 'Invalid credential'
  end
end
