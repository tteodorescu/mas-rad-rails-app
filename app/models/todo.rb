class Todo < ActiveRecord::Base
  validates_presence_of :title
  
  scope :completed, -> { where(completed: true) }
  scope :active, -> { where(completed: false) }
end
