class PostImage < ApplicationRecord

  belongs_to :user
  attachment :image
  attachment :post_image
  attachment :user
end
