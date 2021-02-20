class Post < ApplicationRecord
  belongs_to :user, optional: true
  
  has_many :comments, dependent: :destroy
  
  has_many :favorites
  has_many :likers, through: :favorites, source: :user , dependent: :destroy
  
  
  mount_uploader :image, ImageUploader
  
  validates :content, presence: true, length: { maximum: 500 }
  validates :title, presence: true, length: { maximum: 50 }
  
    
  def self.search(search)
      if search
        Post.where(['title LIKE ?', "%#{search}%"])
      end
  end
    
end
