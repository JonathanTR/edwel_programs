class Course < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  validates_presence_of :title
  validates_uniqueness_of :title
  has_and_belongs_to_many :locations
  has_many :seminars
end