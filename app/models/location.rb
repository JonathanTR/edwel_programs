class Location < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
  
  validates_presence_of :name
  validates_uniqueness_of :name
  has_and_belongs_to_many :courses
end