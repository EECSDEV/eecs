class Feedback < ActiveRecord::Base
  belongs_to :course, :counter_cache => true
  belongs_to :user, :counter_cache => true
  validates_presence_of :content, :rating, :year,:partitioning,:test_homework,:lecture_way
end
