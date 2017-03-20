include Support::UserAuth
include Support::CheckAttributes
include Support::Projects
include Support::Tasks
include Support::Comments

feature 'Create comment', type: :feature, js: true do
  let(:user) { create :user, :default_password }

  background do
    @project = create :project, user: user
    @task = create :task, :with_comments, project: @project
    sign_in email: user.email
    sleep 1
    choose_project(@project)
    show_comments(@task)
  end

  scenario 'user can create new comment' do
    attributes = attributes_for(:comment)
    create_comment(@task, attributes)
    expect(page).to have_content(I18n.t('comment.success.created',
                                        title: attributes[:title]))
    check_hidden_title(Comment.last)
  end

  scenario 'when user write invalid title' do
    attributes = attributes_for(:comment, title: nil)
    create_comment(@task, attributes)
    expect(page).to have_content(I18n.t('validation.required'))
  end
end
