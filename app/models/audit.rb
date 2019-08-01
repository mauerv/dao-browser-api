class Audit < ApplicationRecord
  belongs_to :auditor
  belongs_to :dao
end
