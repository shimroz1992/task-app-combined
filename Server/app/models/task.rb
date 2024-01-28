class Task < ApplicationRecord
  	enum status: { to_do: 0, in_progress: 1, done: 2 }
	validates :title, presence: true
	# validates :status, presence: true
	# belongs_to :user
end
