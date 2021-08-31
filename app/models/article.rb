class Article < ApplicationRecord
  def a_method_used_for_validation_purposes
    errors.add(:title, "cannot contain the characters !@#%*()_-+=")
  end
  has_many :comments, dependent: :destroy
  validates_associated :comments
  validates :title, presence: true,
            length: { minimum: 4 }


end
