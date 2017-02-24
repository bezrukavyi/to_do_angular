class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :checked, :priority, :completed_at, :created_at
end
