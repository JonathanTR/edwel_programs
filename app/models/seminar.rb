class Seminar < ActiveRecord::Base
  belongs_to :course
  belongs_to :location
end