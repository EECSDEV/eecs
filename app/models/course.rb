class Course < ActiveRecord::Base
  has_many :feedbacks
  has_many :pastexams

  validates_presence_of :name, :description,:instructor
end
