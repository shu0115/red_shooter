# coding: utf-8
class Player < ActiveRecord::Base
  attr_accessible :email, :user_id

  belongs_to :user
end
