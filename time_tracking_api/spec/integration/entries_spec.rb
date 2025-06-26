require 'swagger_helper'

RSpec.describe 'Entries API', type: :request do
  path '/entries' do
    get 'List entries' do
      tags 'Entries'
      produces 'application/json'

      response '200', 'entries found' do
        schema type: :array, items: {
          type: :object,
          properties: {
            id: { type: :integer },
            date: { type: :string, format: 'date' },
            duration: { type: :integer },
            description: { type: :string },
            project_id: { type: :integer },
            created_at: { type: :string, format: 'date-time' },
            updated_at: { type: :string, format: 'date-time' }
          },
          required: %w[id date duration description project_id created_at updated_at]
        }

        before do
          project = Project.create(name: 'Test')
          Entry.create(date: Date.today, duration: 60, description: 'Test entry', project: project)
        end

        run_test!
      end

    end

    post 'Create an entry' do
      tags 'Entries'
      consumes 'application/json'
      parameter name: :entry, in: :body, schema: {
        type: :object,
        properties: {
          date: { type: :string, format: 'date' },
          duration: { type: :integer },
          description: { type: :string },
          project_id: { type: :integer }
        },
        required: ['date', 'duration', 'description', 'project_id']
      }

      response '201', 'entry created' do
        let(:project) { Project.create(name: 'Test') }
        let(:entry) { { date: Date.today.to_s, duration: 30, description: 'Desc', project_id: project.id } }

        run_test!
      end

      response '422', 'invalid request' do
        let(:entry) { { date: '', duration: nil, description: '', project_id: nil } }

        run_test!
      end
    end
  end

  path '/entries/{id}' do
    get 'Retrieve an entry' do
      tags 'Entries'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'entry found' do
        let(:project) { Project.create(name: 'Test') }
        let(:id) { Entry.create(date: Date.today, duration: 45, description: 'Entry', project: project).id }

        run_test!
      end

      response '404', 'entry not found' do
        let(:id) { 'invalid' }

        run_test!
      end
    end

    put 'Update an entry' do
      tags 'Entries'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :integer
      parameter name: :entry, in: :body, schema: {
        type: :object,
        properties: {
          date: { type: :string, format: 'date' },
          duration: { type: :integer },
          description: { type: :string },
          project_id: { type: :integer }
        },
        required: ['date', 'duration', 'description', 'project_id']
      }

      response '200', 'entry updated' do
        let(:project) { Project.create(name: 'Test') }
        let(:id) { Entry.create(date: Date.today, duration: 45, description: 'Entry', project: project).id }
        let(:entry) { { date: Date.today.to_s, duration: 90, description: 'Updated', project_id: project.id } }

        run_test!
      end

      response '422', 'invalid request' do
        let(:project) { Project.create(name: 'Test') }
        let(:id) { Entry.create(date: Date.today, duration: 15, description: 'Entry', project: project).id }
        let(:entry) { { date: '', duration: nil, description: '', project_id: nil } }

        run_test!
      end
    end

    delete 'Delete an entry' do
      tags 'Entries'
      parameter name: :id, in: :path, type: :integer

      response '204', 'entry deleted' do
        let(:project) { Project.create(name: 'Test') }
        let(:id) { Entry.create(date: Date.today, duration: 15, description: 'Entry', project: project).id }

        run_test!
      end

      response '404', 'entry not found' do
        let(:id) { 'invalid' }

        run_test!
      end
    end
  end
end