class User < ApplicationRecord
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
  has_one :country
  has_one :state
  has_one :city


  
  # def soft_delete  
  #   update_attribute(:deleted_at, Time.current)  
  # end 

  # def active_for_authentication?  
  #   super && !deleted_at  
  # end 

  # def inactive_message   
  #   !deleted_at ? super : :deleted_account  
  # end 

end
