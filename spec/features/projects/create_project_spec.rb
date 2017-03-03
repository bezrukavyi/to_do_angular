include Support::UserAuth
include Support::CheckAttributes
include Support::Projects

feature 'Create project', type: :feature, js: true do
  let(:user) { create :user, :default_password }

  background do
    sign_in email: user.email
    visit '#!/'
    sleep 1
  end

  scenario 'user can create new project' do
    create_project
    expect(page).to have_content('Project success created')
    check_hidden_title(Project.last)
  end
end
