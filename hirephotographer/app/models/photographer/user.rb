class Photographer::User < ApplicationRecord
  attr_accessor :remember_token
  has_one :personalinformation,dependent: :destroy, foreign_key: 'photographer_user_id'
  has_one :profile,dependent: :destroy, foreign_key: 'photographer_user_id'
  has_many :applications, foreign_key: 'photographer_user_id'
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
  has_secure_password

  def Photographer.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  def Photographer.new_token
    SecureRandom.urlsafe_base64
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

  before_save :set_role

  def set_role
    self.role = 0
=begin
    p @roles
    self.role = User.roles.photographer;
=end
  end


  filterrific :default_filter_params => { :sorted_by => 'created_at_desc' },
              :available_filters => %w[
                sorted_by
                search_query
                with_customer_id
                is_available
              ]

  # default for will_paginate
  self.per_page = 20


  scope :search_query, lambda { |query|
    return nil  if query.blank?
    # condition query, parse into individual keywords
    terms = query.downcase.split(/\s+/)
    # replace "*" with "%" for wildcard searches,
    # append '%', remove duplicate '%'s
    terms = terms.map { |e|
      (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }
    # configure number of OR conditions for provision
    # of interpolation arguments. Adjust this if you
    # change the number of OR conditions.
    num_or_conditions = 2
    where(
        terms.map {
          or_clauses = [
              "LOWER(job_details.jobTitle) LIKE ?",
              "LOWER(job_details.location) LIKE ?"
          ].join(' OR ')
          "(#{ or_clauses })"
        }.join(' AND '),
        *terms.map { |e| [e] * num_or_conditions }.flatten
    )
  }

  scope :sorted_by, lambda { |sort_option|
    # extract the sort direction from the param value.
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
      when /^created_at_/
        order("job_details.created_at #{ direction }")
      when /^jobtitle_/
        order("LOWER(job_details.jobTitle) #{ direction }")
      when /^location_/
        order("LOWER(job_details.location) #{ direction }")
      when /^customer_name_/
        order("LOWER(user.firstname) #{ direction }").includes(:country)
      else
        raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }
  scope :with_customer_id, lambda { |customer_user_ids|
    where(:customer_user_id => [*customer_user_ids])
  }
  scope :with_created_at_gte, lambda { |ref_date|
    where('job_details.created_at >= ?', ref_date)
  }



  def self.options_for_sorted_by
    [
        ['Job Title (a-z)', 'jobtitle_asc'],
        ['Location (a-z)', 'location_asc'],
        ['Created Date (newest first)', 'created_at_desc'],
        ['Created date (oldest first)', 'created_at_asc'],
        ['Customer (a-z)', 'customer_user_name_asc']
    ]
  end

  def decorated_created_at
    created_at.to_date.to_s(:long)
  end
end
