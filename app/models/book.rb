class Book < ApplicationRecord
  belongs_to :author

  validates :title, presence: true

  def self.filter_by_title_starts_with(search)
    where('title like ?', "%#{search}%")
  end
end
