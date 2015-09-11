class Feedback < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  validates_presence_of :content, :rating, :year,:partitioning,:test_homework,:lecture_way
end
