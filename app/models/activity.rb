class Activity < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :project
end
