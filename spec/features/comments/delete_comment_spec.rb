include Support::UserAuth
include Support::CheckAttributes
include Support::Projects
include Support::Tasks
include Support::Comments

feature 'Delete comment', type: :feature, js: true do
  let(:user) { create :user, :default_password }

  background do
    @project = create :project, user: user
    @task = create :task, :with_comments, project: @project
    sign_in email: user.email
    wait_ajax
    choose_project(@project)
    show_comments(@task)
  end

  scenario 'user can get list of commets' do
    comment = @task.comments.first
    delete_comment(comment)
    expect(page).to have_content(I18n.t('comment.success.deleted',
                                        title: comment.title))
    check_hidden_title(comment, :title, false)
  end
end
