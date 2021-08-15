class Task < ApplicationRecord
validates :name, presence: true, length: { maximum: 10 }, uniqueness: true
validates :content, presence: true, length: { maximum: 100 }
validates :deadline, presence: true
validates :status, presence: true
  enum status: {
    not_started: 0,
    on_going: 1,
    completed: 2
  }
end