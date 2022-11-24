class User < ApplicationRecord

  after_create :create_user_cart
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :image, as: :imageable, dependent: :destroy
  mount_uploader :image, ProfilePicUploader
  # validates_integrity_of  :profile_pic
  # validates_processing_of :profile_pic
  enum role: {customer: 0,seller: 1, admin: 2}
  enum status: {pending: 0, active: 1}


  has_many :comments
  has_many :likes
  has_many :products
  has_many :catagories
  has_many :subcatagories
  belongs_to :country
  belongs_to :state
  belongs_to :city
  has_one :cart
  has_many :orders, dependent: :destroy


  def create_user_cart
      @current_cart=Cart.create(user_id: self.id)
  end

  def is?( requested_role )
    self.role == requested_role.to_s
  end

end
