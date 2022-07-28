class Account < ApplicationRecord
  has_many :urers
  validates :name, presence: true
end
