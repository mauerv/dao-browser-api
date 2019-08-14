class Dao < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_one_attached :image

  has_many :podcasts, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :documents, dependent: :destroy
  has_many :audits, dependent: :destroy
  has_many :contracts, dependent: :destroy
  has_and_belongs_to_many :contributors
  has_and_belongs_to_many :tags
  belongs_to :status
  belongs_to :blockchain
  belongs_to :framework

  accepts_nested_attributes_for :documents, allow_destroy: true

  def serializable_hash(options={})
    if self.image.attached?
      super(options).merge({"image_url": rails_blob_url(self.image)})
    else
      super(options)
    end
  end
end
