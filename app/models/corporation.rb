# coding: utf-8
class Corporation < ActiveRecord::Base
  attr_accessible :email, :name, :user_id

  belongs_to :user
  has_many :jobs
end
