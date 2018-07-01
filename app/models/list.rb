class List < ApplicationRecord
  has_many :tasks, -> { order(position: :asc) }
  has_ancestry
  acts_as_list scope: [:ancestry]
end
