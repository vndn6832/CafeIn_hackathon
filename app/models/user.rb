class User < ActiveRecord::Base
  has_many :posts
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :favorite
  has_many :shops, through: :favorite
  has_many :posts
  has_many :favorites
  has_many :comments
  has_many :line_items
  
  after_create :assign_default_role
  def assign_default_role
    self.add_role(:customer) if self.roles.blank?
  end
end
