class Seminar < ActiveRecord::Base
  belongs_to :course
  has_one :location, through: :course
end