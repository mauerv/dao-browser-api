class Contributor < ApplicationRecord
  has_and_belongs_to_many :daos
end
