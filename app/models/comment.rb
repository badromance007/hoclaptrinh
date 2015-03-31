class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :link

  validates :body, presence: true, length: { minimum: 4, :message => 'Bình luận phải có ít nhất 4 ký tự trở lên!!!!!!' }
  validates :user_id, presence: true
  validates :link_id, presence: true

end
