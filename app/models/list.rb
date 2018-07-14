class List < ApplicationRecord
  has_many :tasks
  has_ancestry
  acts_as_list scope: [:ancestry]
end
