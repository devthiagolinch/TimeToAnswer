class Question < ApplicationRecord
  belongs_to :subject

    # Kaminari Pagination
    paginates_per 10
end
