include Support::UserAuth
include Support::CheckAttributes
include Support::Projects

feature 'Show project', type: :feature, js: true do
  let(:user) { create :user, :default_password }

  background do
    @projects = create_list(:project, 2, :with_tasks, user: user)
    sign_in email: user.email
    visit '#!/'
    sleep 1
  end

  scenario 'user can show list projects' do
    @projects.each do |project|
      expect(page).to have_content(project.title)
    end
  end

  scenario 'user can choose project' do
    project = @projects.first
    expect(page).to have_no_css('.hidden', text: project.title)
    check_hidden_title(project, :title, false)
    check_hidden_title(project.tasks, :title, false)
    choose_project(project)
    check_hidden_title(project)
    check_hidden_title(project.tasks)
  end
end
