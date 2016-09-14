class Task < ActiveRecord::Base
  validates :title, :date, presence: true
end
