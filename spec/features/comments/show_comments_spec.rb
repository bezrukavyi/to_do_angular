include Support::UserAuth
include Support::CheckAttributes
include Support::Projects
include Support::Tasks

feature 'Show comments', type: :feature, js: true do
  let(:user) { create :user, :default_password }

  background do
    @project = create :project, user: user
    @task = create :task, :with_comments, project: @project
    sign_in email: user.email
    sleep 1
    choose_project(@project)
  end

  scenario 'user can get list of commets' do
    show_comments(@task)
    check_hidden_title(@task.comments)
  end
end
