class Post < ApplicationRecord
  belongs_to :user
  
  has_many :comments, dependent: :destroy
  
  
  mount_uploader :image, ImageUploader
  
  validates :content, presence: true, length: { maximum: 500 }
  validates :title, presence: true, length: { maximum: 50 }
  
    
  def self.search(search)
      if search
        Post.where(['title LIKE ?', "%#{search}%"])
      end
  end
    
end
