# spec/models/task_spec.rb
require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:status) }

    it 'validates that status is a valid enum value' do
      should define_enum_for(:status)
        .with_values(to_d: 0, in_progress: 1, done: 2)
        .backed_by_column_of_type(:integer)
    end
  end

  describe 'associations' do
    it { should belong_to(:user) }
  end
end
