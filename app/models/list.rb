class List < ApplicationRecord
  has_many :tasks, -> { order(position: :asc) }
  has_ancestry
end
