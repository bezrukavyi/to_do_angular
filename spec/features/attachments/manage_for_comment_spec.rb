include Support::UserAuth
include Support::CheckAttributes
include Support::Projects
include Support::Tasks
include Support::Comments
include Support::Attachments

feature 'Show for comment', type: :feature, js: true do
  let(:user) { create :user, :default_password }
  let(:project) { create :project, user: user }
  let(:task) { create :task, :with_comments, project: project }

  before do
    @comment = create :comment, task: task
    @attachment = create :attachment, comment: @comment
    sign_in email: user.email
    wait_ajax
    choose_project(project)
    show_comments(task)
    show_attachment(@comment)
  end

  scenario 'user can get list of attachments' do
    title = I18n.t('attachment.title', name: @comment.title)
    expect(page).to have_content(title)
    check_attachment_attrs(@attachment)
  end

  scenario 'user can create attachment for comment' do
    options = attributes_for(:attachment)
    attachment_upload(options, @comment)
    check_attachment_attrs(Attachment.last)
  end

  scenario 'user can delete attachment' do
    delete_attachment(@attachment)
    check_attachment_attrs(@attachment, false)
  end
end
