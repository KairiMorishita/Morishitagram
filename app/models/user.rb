class User < ApplicationRecord
  has_many  :posts, dependent: :destroy
  validates :username, presence: true, length: { minimum: 3, maximum: 20 }
  validates :name, presence: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  
  devise :omniauthable, omniauth_providers: %i[facebook]
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      #user.email = auth.info.email
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end
end