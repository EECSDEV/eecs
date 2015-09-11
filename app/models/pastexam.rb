class Pastexam < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  mount_uploader :file, AttachmentUploader
  validate :file_size
  validates_length_of :description, :maximum => 15
  validates_presence_of :file

  def file_size
    if file.file
      if file.file.size.to_f/(1000*1000) > 50.0
        errors.add(:file, "You cannot upload a file greater than 50 MB")
      end
    end
  end
  #validates_presence_of :year,:which_time
end
