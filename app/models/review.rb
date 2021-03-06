class Review < ApplicationRecord
  validates :body, presence: true
  validates :rating, presence: true
  validates_numericality_of :rating, greater_than_or_equal_to: 1, less_than_or_equal_to: 5, message: "Rating must be between 1 - 5"
  belongs_to :item
  belongs_to :user
  has_many :votes, dependent: :destroy

  def votes_total
    if self.votes.nil?
      return 0
    else
      votes_arr = self.votes.map { |v| v.value  }
      total = votes_arr.inject(:+)
    end
  end
end
