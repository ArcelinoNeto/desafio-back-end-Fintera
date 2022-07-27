class Entiti < ApplicationRecord
  has_many :entities_users
  belongs_to :account
end
