include Support::UserAuth
include Support::CheckAttributes
include Support::Projects

feature 'Update project', type: :feature, js: true do
  let(:user) { create :user, :default_password }

  background do
    @project = create :project, user: user
    sign_in email: user.email
    visit '#!/'
    sleep 1
  end

  scenario 'user can update title of project' do
    choose_project(@project)
    old_title = @project.title
    new_title = 'Rspec title'
    update_project_title(new_title)
    expect(page).to have_content('Project success updated')
    expect(page).to have_content(new_title)
    expect(page).to have_no_content(old_title)
  end

  scenario 'user update title with invalid data' do
    choose_project(@project)
    update_project_title('')
    expect(page).to have_content('This is required.')
  end
end
