class Task < ApplicationRecord

  enum status: {
    not_started: 0,
    on_going: 1,
    completed: 2
  }
end
