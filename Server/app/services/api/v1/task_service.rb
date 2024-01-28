module Api
  module V1
    # TaskService
    class TaskService
      attr_reader :user, :params

      def initialize(params)
        @params = params
      end

      def index
        tasks = Task.paginate(page: params[:page], per_page: params[:per_page] || 10)
        tasks = sort_tasks(tasks) if params[:sort].present?
        filter_tasks(tasks)
      end

      def show(id)
        Task.find_by_id(id)
      end

      def create(task_params)
        Task.create(task_params)
      end

      def update(task, task_params)
        task.update(task_params)
      end

      def destroy(task)
        task.destroy
      end

      def mark_done(task)
        task.update(status: 'done')
      end

      private

      def sort_tasks(tasks)
        sort_param = params[:sort]
        direction = params[:direction] || 'asc'
        tasks.order("#{sort_param} #{direction}") if sort_param.present?
      end

      # rubocop:disable Metrics/MethodLength
      # rubocop:disable Metrics/AbcSize
      def filter_tasks(tasks)
        filters = {}

        filters[:status] = Task.statuses[params[:status]] if params[:status].present?
        filters[:title] = params[:title] if params[:title].present?
        filters[:description] = params[:description] if params[:description].present?

        if params[:due_date].present?
          begin
            due_date = Date.strptime(params[:due_date], '%d-%m-%Y')
            filters[:due_date] = due_date.beginning_of_day..due_date.end_of_day
          rescue ArgumentError
            raise ActionController::BadRequest.new({ error: 'Invalid date format. Please use dd-mm-yyyy' })
          end
        end

        if filters.present?
          tasks.where(filters)
        else
          tasks
        end
      end
      # rubocop:enable Metrics/MethodLength
      # rubocop:enable Metrics/AbcSize
    end
  end
end