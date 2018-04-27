class Project < ActiveRecord::Base
  validates :content, :rating, :presence => true
  belongs_to :project
end
