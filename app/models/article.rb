class CallbackForArticle
  def self.after_destroy(article)
    puts "my object has destroyed"
  end
end

class Article < ApplicationRecord
  def a_method_used_for_validation_purposes
    errors.add(:title, "cannot contain the characters !@#%*()_-+=")
  end
  has_many :comments, dependent: :destroy, inverse_of: :article
  validates_associated :comments
  validates :title, presence: true,
            length: { minimum: 4 }
  after_validation :capitalize_name
  after_initialize do |article|
    puts "You have initialized an object!"
  end
  after_commit :show_message, on: :create
  after_destroy CallbackForArticle

  private
  def capitalize_name
    self.title = title.capitalize
  end
  def show_message
    puts "object has saved"
  end

end
