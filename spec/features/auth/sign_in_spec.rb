include Support::UserAuth

feature 'Sign in', type: :feature, js: true do
  scenario 'When user success sign in' do
    user = create :user
    visit '#!/sign_in'
    sign_in('new_user', email: user.email, password: user.password)
    expect(page).to have_content 'Success singed in'
  end

  scenario 'When user not authed' do
    visit '#!/sign_in'
    sign_in('new_user', email: 'rspec555@gmail.com', password: 'rspec555')
    expect(page).to have_content 'Invalid credential'
  end
end
