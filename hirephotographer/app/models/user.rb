class User < ApplicationRecord
  attr_accessor :remember_token
  enum roles: [:photographer, :customer, :admin]
  validates_confirmation_of :username, :password
  validates_confirmation_of :email,
                            message: 'should match confirmation'
  validates_exclusion_of :password, in: ->(user) { [user.username, user.email] },
                         message: 'should not be the same as your username or email address'
  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\Z/i
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :password, :confirmation => true #password_confirmation attr
  validates_length_of :password, :in => 6..20, :on => :create
  #has_one :photographer_user, :class_name => 'Photographer::User',  foreign_key: 'user_id',  autosave: true
  #has_one :customer_user, :class_name => 'Customer::User', foreign_key: 'user_id',  autosave: true
  has_one :personalinformation,dependent: :destroy, foreign_key: 'user_id'
  has_one :profile,dependent: :destroy, foreign_key: 'user_id',  autosave: true
  has_secure_password
  has_many :conversations, :foreign_key => :sender_id
  # @param [Object] string
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end


end
