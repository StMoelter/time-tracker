require 'swagger_helper'

RSpec.describe 'Projects API', type: :request do
  path '/projects' do
    get 'List projects' do
      tags 'Projects'
      produces 'application/json'

      response '200', 'projects found' do
        schema type: :array, items: {
          type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            created_at: { type: :string, format: 'date-time' },
            updated_at: { type: :string, format: 'date-time' }
          },
          required: %w[id name created_at updated_at]
        }

        before do
          Project.create(name: 'Test')
        end

        run_test!
      end
    end

    post 'Create a project' do
      tags 'Projects'
      consumes 'application/json'
      parameter name: :project, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: ['name']
      }

      response '201', 'project created' do
        let(:project) { { name: 'Test' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:project) { { name: '' } }
        run_test!
      end
    end
  end

  path '/projects/{id}' do
    get 'Retrieve a project' do
      tags 'Projects'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'project found' do
        let(:id) { Project.create(name: 'Test').id }
        run_test!
      end

      response '404', 'project not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    put 'Update a project' do
      tags 'Projects'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :integer
      parameter name: :project, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: ['name']
      }

      response '200', 'project updated' do
        let(:id) { Project.create(name: 'Test').id }
        let(:project) { { name: 'Updated' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:id) { Project.create(name: 'Test').id }
        let(:project) { { name: '' } }
        run_test!
      end
    end

    delete 'Delete a project' do
      tags 'Projects'
      parameter name: :id, in: :path, type: :integer

      response '204', 'project deleted' do
        let(:id) { Project.create(name: 'Test').id }
        run_test!
      end

      response '404', 'project not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end