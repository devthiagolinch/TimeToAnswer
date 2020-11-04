class Subject < ApplicationRecord
  has_many :questions
  # Kaminari Pagination
  paginates_per 10
end
