class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :checked, :position, :completed_at, :created_at
end
