include Support::Auth

describe Api::TasksController, type: :controller do
  let(:user) { create :user }
  let(:project) { create :project, :with_tasks, user: user }

  before do
    @tasks = project.tasks
    @task = @tasks.first
    @another_task = create :task, :with_project
    auth_request user
  end

  describe 'POST #create' do
    let(:valid_params) do
      { task: attributes_for(:task, project_id: project.id) }
    end

    it 'returns a successful 200 response' do
      post :create, params: valid_params
      expect(response).to be_success
    end
    it 'create new task' do
      expect { post :create, params: valid_params }
        .to change { @tasks.reload.count }.by(1)
    end
    it 'when data invalid' do
      post :create, params: { task: attributes_for(:task, :invalid,
                                                   project_id: project.id) }
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['error']).not_to be_blank
    end
  end

  describe 'PATCH #update' do
    let(:valid_params) do
      { id: @task.id, task: attributes_for(:task, title: 'New title') }
    end

    it 'returns a successful 200 response' do
      patch :update, params: valid_params
      expect(response).to be_success
    end
    it 'update task' do
      expect { patch :update, params: valid_params }
        .to change { @task.reload.attributes }
    end
    it 'when data invalid' do
      patch :update, params: { id: @task.id,
                               task: attributes_for(:project, :invalid) }

      parsed_response = JSON.parse(response.body)
      expect(parsed_response['error']).not_to be_blank
    end
  end

  describe 'DELETE #destroy' do
    it 'returns a successful 200 response' do
      delete :destroy, params: { id: @task.id }
      expect(response).to be_success
    end
    it 'destroy task' do
      expect { delete :destroy, params: { id: @task.id } }
        .to change { @tasks.reload.count }.by(-1)
    end
    it 'when data invalid' do
      delete :destroy, params: { id: 100 }
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['error']).not_to be_blank
    end
  end
end
