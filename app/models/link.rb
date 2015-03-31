class Link < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, uniqueness: true, presence: true
  validates :url, uniqueness: true, presence: true
  validates :description, presence: true
  validates :site_name, presence: true
  


  acts_as_taggable
end
