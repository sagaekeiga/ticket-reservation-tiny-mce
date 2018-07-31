class TicketImage < ApplicationRecord
  mount_uploader :image, TicketImageUploader
  # -------------------------------------------------------------------------------
  # Relations
  # -------------------------------------------------------------------------------
  belongs_to :ticket, optional: :true
end
