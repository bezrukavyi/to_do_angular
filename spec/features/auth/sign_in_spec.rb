include Support::UserAuth

feature 'Sign in', type: :feature, js: true do
  scenario 'When user success sign in' do
    user = create :user
    sign_in email: user.email, password: user.password
    expect(page).to have_content 'Success singed in'
    expect(page).to have_css('#sign-out')
  end

  scenario 'User has already signed in' do
    user = create :user, :default_password
    sign_in email: user.email
    sleep 3
    visit '#!/sign_in'
    expect(page).to have_content 'You have already sined in'
  end

  scenario 'When user write invalid data' do
    sign_in email: 'rspec555@gmail.com', password: 'rspec555'
    expect(page).to have_content 'Invalid credential'
  end
end
