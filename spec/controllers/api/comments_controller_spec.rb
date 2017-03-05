include Support::Auth

describe Api::CommentsController, type: :controller do
  let(:user) { create :user }
  let(:project) { create :project, user: user }
  let(:task) { create :task, :with_comments, project: project }

  before do
    @comments = task.comments
    @comment = @comments.first
    @another_comment = create :comment
    auth_request user
  end

  describe 'POST #create' do
    let(:valid_params) do
      { comment: attributes_for(:comment, task_id: task.id) }
    end

    it 'returns a successful 200 response' do
      post :create, params: valid_params
      expect(response).to be_success
    end
    it 'create new comment' do
      expect { post :create, params: valid_params }
        .to change { @comments.reload.count }.by(1)
    end
    it 'when data invalid' do
      post :create, params: { comment: attributes_for(:comment, :invalid,
                                                      task_id: task.id) }
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['error']).not_to be_blank
    end
  end

  describe 'PATCH #update' do
    let(:valid_params) do
      { id: @comment.id, comment: attributes_for(:comment, title: 'New title') }
    end

    it 'returns a successful 200 response' do
      patch :update, params: valid_params
      expect(response).to be_success
    end
    it 'update comment' do
      expect { patch :update, params: valid_params }
        .to change { @comment.reload.attributes }
    end
    it 'when data invalid' do
      patch :update, params: { id: @comment.id,
                               comment: attributes_for(:comment, :invalid) }

      parsed_response = JSON.parse(response.body)
      expect(parsed_response['error']).not_to be_blank
    end
  end

  describe 'DELETE #destroy' do
    it 'returns a successful 200 response' do
      delete :destroy, params: { id: @comment.id }
      expect(response).to be_success
    end
    it 'destroy comment' do
      expect { delete :destroy, params: { id: @comment.id } }
        .to change { @comments.reload.count }.by(-1)
    end
    it 'when data invalid' do
      delete :destroy, params: { id: 100 }
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['error']).not_to be_blank
    end
  end
end
