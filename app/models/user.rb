class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :feedbacks
  has_many :pastexams
	validates_uniqueness_of :username
	validates_presence_of :username
	validates :username , length: {in: 4..20}

	attr_accessor :login
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["username = :value OR lower(email) = lower(:value) ", { :value => login }]).first
		else
	    where(conditions.to_hash).first
	  end
  end
  

end
