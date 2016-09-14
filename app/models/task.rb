class Task < ActiveRecord::Base
  validates :title, :date, presence: true
  validates :title, length: { minimum: 5 }
end
