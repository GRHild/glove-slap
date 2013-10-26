class Slap < ActiveRecord::Base
  belongs_to :challenger, :class_name => 'User', :foreign_key => 'challenger_id'
  belongs_to :target, :class_name => 'User', :foreign_key => 'target_id'
end
