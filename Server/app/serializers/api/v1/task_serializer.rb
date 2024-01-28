# TaskSerializer
module Api
  module V1
    # TaskSerializer
    class TaskSerializer < ActiveModel::Serializer
      attributes :id, :title, :description, :status, :due_date, :created_at, :updated_at
    end
  end
end
