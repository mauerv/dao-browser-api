class Dao < ApplicationRecord
  include Rails.application.routes.url_helpers
  
  has_one_attached :image

  has_many :podcasts
  has_many :articles
  has_many :documents
  has_many :audits
  has_many :contracts
  has_and_belongs_to_many :contributors
  has_and_belongs_to_many :tags
  belongs_to :status
  belongs_to :blockchain
  belongs_to :framework

  def serializable_hash(options={})
    if self.image.attached?
      super(options).merge({"image_url": rails_blob_url(self.image)})
    else
      super(options)
    end
  end
end
