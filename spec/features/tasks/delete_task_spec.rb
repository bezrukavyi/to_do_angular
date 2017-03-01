include Support::UserAuth
include Support::CheckAttributes
include Support::Projects
include Support::Tasks

feature 'Delete task', type: :feature, js: true do
  let(:user) { create :user, :default_password }

  background do
    @project = create :project, user: user
    @task = create :task, project: @project
    sign_in email: user.email
    visit '#!/'
    sleep 1
    choose_project(@project)
  end

  scenario 'user can delete project' do
    delete_task(@task)
    expect(page).to have_content("Task '#{@task.title}' success deleted")
    check_hidden_title(@task, :title, false)
  end
end
