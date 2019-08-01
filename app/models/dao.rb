class Dao < ApplicationRecord
  has_many :podcasts
  has_many :articles
  has_many :documents
  has_many :audits
  has_many :contracts
  has_and_belongs_to_many :contributors
  belongs_to :status
  belongs_to :blockchain
  belongs_to :framework
end
