class Entiti < ApplicationRecord
  has_many :entiti_users
  belongs_to :account
end
