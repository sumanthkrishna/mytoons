class User < ActiveRecord::Base
  rolify
  validates :first_name,:last_name,:phone_number, :presence => true
  validates :phone_number, :numericality => { :only_integer => true }
  validates :phone_number, :length => {:is => 10}
  validates :phone_number, :numericality => { :only_integer => true }
  validates :password, :presence =>true, :length => { :minimum => 6, :maximum => 16 },:on=>:create
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :comments, :dependent => :destroy
  has_many :toons, :dependent => :destroy

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation,:first_name,:last_name,:phone_number, :remember_me,:role_ids

  after_create :creating_role_for_external_users
  def creating_role_for_external_users
    self.add_role :User
  end

  def fullname
    "#{first_name} #{last_name}"
  end

end
