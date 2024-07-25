class Task < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :priority, presence: true, inclusion: { in: %w(High Medium Low), message: "-> Invalid payment method." }
  validates :completed, inclusion: { in: [true, false] }
  validates :user, presence: true
end
