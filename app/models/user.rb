class User < ActiveRecord::Base
  after_create :set_default_role
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :wikis
  has_many :collaborators
  has_many :wikis, through: :collaborators

  def set_default_role
    self.role ||= "user"
  end

  def is_premium?
    self.role == "premium"
  end

end
