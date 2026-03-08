class Customer < ApplicationRecord
  has_one_attached :image

  validates :full_name, presence: true
  validates :email_address, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }, allow_blank: true
  validates :phone_number, presence: true

  def has_image?
    image.attachment.present?
  rescue
    false
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

  def self.ransackable_attributes(auth_object = nil)
    ["full_name", "phone_number", "email_address", "notes", "created_at", "updated_at"]
  end
end
