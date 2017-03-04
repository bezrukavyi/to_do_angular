include Support::UserAuth
include Support::CheckAttributes
include Support::Projects
include Support::Tasks

feature 'Update task', type: :feature, js: true do
  let(:user) { create :user, :default_password }

  background do
    @project = create :project, user: user
    @task = create :task, project: @project
    sign_in email: user.email
    visit '#!/'
    sleep 1
    choose_project(@project)
  end

  scenario 'user can update task title' do
    old_title = @task.title
    new_title = 'New title'
    update_task_title(@task, new_title)
    exist_hidden_value(old_title, false)
    exist_hidden_value(new_title, true)
  end

  scenario 'user write invalid task title' do
    update_task_title(@task, nil)
    expect(page).to have_content(I18n.t('validation.required'))
  end

  scenario 'user can check task' do
    task_checkbox(@task).click
    expect(checkbox_state(@task)).to eq('true')
    task_checkbox(@task).click
    expect(checkbox_state(@task)).to eq('false')
  end
end
