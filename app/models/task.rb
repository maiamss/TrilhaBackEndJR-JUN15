class Task < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :priority, presence: true, inclusion: { in: %w(High Medium Low), message: "-> The task must have High, Medium or Low priority" }
  validates :completed, inclusion: { in: [true, false] }
  validates :user, presence: true
end
