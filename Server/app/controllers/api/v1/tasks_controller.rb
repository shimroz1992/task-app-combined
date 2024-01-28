module Api
  module V1
    class TasksController < ApplicationController
      # before_action :authenticate_user!
      before_action :set_task, only: %i[show update destroy mark_done]

      def index
        tasks = TaskService.new(params).index
        render json: tasks, each_serializer: Api::V1::TaskSerializer
      end

      def show
        render json: @task, serializer: Api::V1::TaskSerializer
      end

      def create
        @task = TaskService.new(params).create(task_params)

        if @task.save
          render json: @task, status: :created, serializer: Api::V1::TaskSerializer
        else
          render json: @task.errors, status: :unprocessable_entity
        end
      end

      def update
        if TaskService.new(params).update(@task, task_params)
          render json: @task, serializer: Api::V1::TaskSerializer
        else
          render json: @task.errors, status: :unprocessable_entity
        end
      end

      def destroy
        TaskService.new(params).destroy(@task)
        head :no_content
      end

      def mark_done
        if TaskService.new(current_user, params).mark_done(@task)
          render json: @task, serializer: Api::V1::TaskSerializer
        else
          render json: @task.errors, status: :unprocessable_entity
        end
      end

      private

      def set_task
        @task = TaskService.new(params).show(params[:id])
        render json: { error: 'Task not found' }, status: :not_found unless @task
      end

      def task_params
        params.require(:task).permit(:title, :description, :status, :due_date)
      end
    end
  end
end