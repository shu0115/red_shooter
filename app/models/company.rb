# coding: utf-8
class Company < ActiveRecord::Base
  attr_accessible :email, :name, :user_id, :content

  belongs_to :user
  has_many :jobs
end
