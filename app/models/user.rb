# frozen_string_literal: true

class User < ApplicationRecord
  has_many :applications
  has_many :applied_jobs, through: :applications, source: :job

  has_many :jobs # that they have created

  validates :name,  uniqueness: true, presence: true
  # validates :email, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github facebook google_oauth2]

  def self.from_omniauth(auth)
  
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name # assuming the user model has a name
      user.username = auth.info.nickname # assuming the user model has a username
      user.image_url = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
    # user = User.find_by(email: auth.info.email)
    
    #  if !user
    # #    user.provider = auth.provider
    # #    user.uid = auth.uid
    # #    user.save
    # #  else
    #    user = User.where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    #     user.email = auth.info.email
    #     user.password = Devise.friendly_token[0, 20]
    #     user.name = auth.info.name # assuming the user model has a name
    #     user.username = auth.info.nickname # assuming the user model has a username
    #    end
    #  end
    
    
    end
end
