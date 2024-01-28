# spec/controllers/api/v1/tasks_controller_spec.rb
require 'rails_helper'
# rubocop:disable Metrics/BlockLength

RSpec.describe Api::V1::TasksController, type: :controller do
  # rubocop:enable Metrics/BlockLength

  let(:user) { create(:user) }
  let(:task) { create(:task, user: user) }

  before do
    # Assuming you have set up FactoryBot for creating test data
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    # Add more tests for pagination, sorting, and filtering if needed
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      get :show, params: { id: task.id }
      expect(response).to have_http_status(:ok)
    end

    it 'returns the correct task details' do
      get :show, params: { id: task.id }
      expect(response.body).to include_json(id: task.id, title: task.title)
    end
  end

  describe 'POST #create' do
    it 'creates a new task' do
      task_attributes = attributes_for(:task)
      post :create, params: { task: task_attributes }
      expect(response).to have_http_status(:created)
      expect(Task.last.title).to eq(task_attributes[:title])
    end

    it 'returns errors if task creation fails' do
      post :create, params: { task: { title: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'PUT #update' do
    it 'updates the task' do
      new_title = 'Updated Title'
      put :update, params: { id: task.id, task: { title: new_title } }
      expect(response).to have_http_status(:ok)
      expect(task.reload.title).to eq(new_title)
    end

    it 'returns errors if task update fails' do
      put :update, params: { id: task.id, task: { title: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the task' do
      delete :destroy, params: { id: task.id }
      expect(response).to have_http_status(:no_content)
      expect(Task.exists?(task.id)).to be_falsey
    end
  end

  describe 'PATCH #mark_done' do
    it 'marks the task as done' do
      patch :mark_done, params: { id: task.id }
      expect(response).to have_http_status(:ok)
      expect(task.reload.status).to eq('done')
    end
  end
end
