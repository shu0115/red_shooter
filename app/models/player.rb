# coding: utf-8
class Player < ActiveRecord::Base
  attr_accessible :email, :user_id, :content

  belongs_to :user
end
