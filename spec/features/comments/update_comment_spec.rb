include Support::UserAuth
include Support::CheckAttributes
include Support::Projects
include Support::Tasks
include Support::Comments

feature 'Update comment', type: :feature, js: true do
  let(:user) { create :user, :default_password }

  background do
    @project = create :project, user: user
    @task = create :task, :with_comments, project: @project
    sign_in email: user.email
    sleep 1
    choose_project(@project)
    show_comments(@task)
  end

  scenario 'user can update comment title' do
    comment = @task.comments.first
    old_title = comment.title
    new_title = 'New title'
    update_comment_title(comment, new_title)
    exist_hidden_value(old_title, false)
    exist_hidden_value(new_title, true)
  end

  scenario 'when user write invalid title' do
    new_title = nil
    update_comment_title(@task.comments.first, new_title)
    expect(page).to have_content(I18n.t('validation.required'))
  end
end
