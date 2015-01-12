class Link < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  has_many :comments, dependent: :destroy

  acts_as_taggable
end
