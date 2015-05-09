class Company < ActiveRecord::Base
  include GlobalID::Identification
  has_many :tasks, as: :client
end
