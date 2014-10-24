class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :timeoutable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :role_id, :confirmed_at

  #enum role: [:user, :admin]
  #after_initialize :set_default_role, :if => :new_record?

  belongs_to :role
  before_create :set_default_role

  def admin?
		role_id == ADMIN_ROLE_ID
	end

	def user?
		role_id == USER_ROLE_ID
	end

  private
  def set_default_role
    self.role ||= Role.find_by_name('user')
  end

  
end
