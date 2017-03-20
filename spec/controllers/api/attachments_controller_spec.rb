include Support::Auth

describe Api::AttachmentsController, type: :controller do
  let(:user) { create :user }
  let(:project) { create :project, user: user }
  let(:task) { create :task, :with_comments, project: project }
  let(:comment) { create :comment, task: task }

  before do
    @attachment = create :attachment, comment: comment
    @attachments = comment.attachments
    auth_request user
  end

  describe 'POST #create' do
    let(:valid_params) do
      { comment_id: comment.id, file: attributes_for(:attachment)[:file] }
    end

    it 'returns a successful 200 response' do
      post :create, params: valid_params
      expect(response).to be_success
    end
    it 'create new task' do
      expect { post :create, params: valid_params }
        .to change { @attachments.reload.count }.by(1)
    end
    it 'when data invalid' do
      post :create, params: { comment_id: comment.id, file: nil }
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['error']).not_to be_blank
    end
  end

  describe 'DELETE #destroy' do
    it 'returns a successful 200 response' do
      delete :destroy, params: { id: @attachment.id }
      expect(response).to be_success
    end
    it 'destroy task' do
      expect { delete :destroy, params: { id: @attachment.id } }
        .to change { @attachments.reload.count }.by(-1)
    end
    it 'when data invalid' do
      delete :destroy, params: { id: 100 }
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['error']).not_to be_blank
    end
  end
end
