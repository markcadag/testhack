class User < ActiveRecord::Base
# Added by Koudoku.
  has_one :subscription

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :omniauthable, :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]

  has_many :test_preparings
  has_many :courses,  -> { distinct }, :through => :test_preparings 

  has_many :academia_takings
  has_many :academies,  -> { distinct }, :through => :academia_takings 

  has_many :topics

  has_many :answers

  has_many :appear_ins

  acts_as_tagger
  acts_as_voter
  acts_as_liker
  
  mount_uploader :avatar, AvatarUploader

  accepts_nested_attributes_for :courses

  acts_as_follower
  acts_as_followable
  
  TEMP_EMAIL_PREFIX = 'change@me'
  TEMP_EMAIL_REGEX = /\Achange@me/

  validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update


 def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.first_name   # assuming the user model has a name
      user.last_name = auth.info.last_name   # assuming the user model has a name
      user.avatar = auth.info.image
      # user.image = auth.info.image # assuming the user model has an image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end


end
