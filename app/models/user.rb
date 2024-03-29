class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :articles, dependent: :destroy
	has_many :comments, dependent: :destroy

	def full_name
		"#{first_name} #{last_name}"
	end
end
