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
  belongs_to :country
  belongs_to :state
  belongs_to :city


  
  # def soft_delete  
  #   update_attribute(:deleted_at, Time.current)  
  # end 

  # def active_for_authentication?  
  #   super && !deleted_at  
  # end 

  # def inactive_message   
  #   !deleted_at ? super : :deleted_account  
  # end 
  validates :first_name, presence: true,
    length: { minimum: 1 }
    validates :email, format: { with: /\A(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})\z/i, message: "Invalid Email" } ,presence: true, 
    uniqueness: { case_sensitive: false },
    length: { minimum: 3 }
    validates :password, presence: true, confirmation: true,
    length: { minimum: 3 }

    validate :check_password
     def check_password
        return if password == password_confirmation
        errors.add :password, 'password do not match'
    end
    validates :phone_number, presence: true, numericality: {only_integer: true},
    length: { minimum: 5 }

end
