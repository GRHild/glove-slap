class User < ActiveRecord::Base
  validates_uniqueness_of :phone_id
  has_many :slaps_challenged, :class_name => "Slap", :foreign_key => 'challenger_id'
  has_many :slaps_targeted, :class_name => "Slap", :foreign_key => 'target_id'
  reverse_geocoded_by :latitude, :longitude
end
