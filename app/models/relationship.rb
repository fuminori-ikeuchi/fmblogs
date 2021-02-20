class Relationship < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :follow, class_name: 'User', optional: true
end
