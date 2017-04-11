module Api
  module V1
    module ProjectsDoc
      extend BaseDoc
      resource :projects

      doc_for :index do
        api :GET, '/projects'
        description 'List projects (:id, :title)'
      end

      doc_for :show do
        api :GET, '/projects/:id'
        param :id, :number
      end
    end
  end
end
