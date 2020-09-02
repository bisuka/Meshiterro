class PostComment < ApplicationRecord
  belongs_to :user
# post_imageのhas_many :post_comments, dependent: :destroyの対になる
  belongs_to :post_image
end
