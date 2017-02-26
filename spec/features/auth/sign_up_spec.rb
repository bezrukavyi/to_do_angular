include Support::UserAuth

feature 'Sign up', type: :feature do
  scenario "User haven't account" do
    visit '#!/sign_up'
    user_attrs = attributes_for(:user)
    sign_up 'new_user', user_attrs
    expect(page).to have_content 'Success signed up'
    get_confirm_email(user_attrs[:email])
  end
end
