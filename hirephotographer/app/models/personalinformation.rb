class Personalinformation < ApplicationRecord
  belongs_to :user, :class_name => 'User'
  has_one :profilepicture,dependent: :destroy, foreign_key: 'personalinformation_id'

  filterrific :default_filter_params => { :sorted_by => 'name_desc' },
              :available_filters => %w[
                sorted_by
                search_photographer
              ]

  # default for will_paginate
  self.per_page = 20


  scope :search_photographer, lambda { |query|

    return nil  if query.blank?

    # condition query, parse into individual keywords
    terms = query.downcase.split(/\s+/)
    # replace "*" with "%" for wildcard searches,
    # append '%', remove duplicate '%'s
    terms = terms.map { |e|
      ('%'+e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }
    # configure number of OR conditions for provision
    # of interpolation arguments. Adjust this if you
    # change the number of OR conditions.
    num_or_conditions = 5

    where(
        terms.map {
          or_clauses = [
              "LOWER(personalinformations.firstname) LIKE ?",
              "LOWER(personalinformations.middlename) LIKE ?",
              "LOWER(personalinformations.lastname) LIKE ?",
              "LOWER(personalinformations.city) LIKE ?",
              "LOWER(personalinformations.country) LIKE ?"
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
      when /^name_/
        order("LOWER(personalinformations.firstName) #{ direction }")
      when /^location_/
        order("LOWER(personalinformations.city) #{ direction }")

      else
        raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")

    end
  }

  def self.options_for_sorted_by
    [
        ['Firstname (a-z)', 'name_asc'],
        ['Location (a-z)', 'location_asc']

    ]
  end
end
