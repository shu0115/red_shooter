class Job < ActiveRecord::Base
  attr_accessible :content, :title, :user_id

  belongs_to :company
end
