class Course < ActiveRecord::Base
  validates_presence_of :title
  validates_uniqueness_of :title
  has_and_belongs_to_many :locations
  has_many :seminars
end