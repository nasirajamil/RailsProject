class Comment < ApplicationRecord
  belongs_to :article, inverse_of: :comments
  validates :commenter, presence: true
end
