# config/initializers/ransack.rb

# Allow ActiveStorage::Attachment attributes to be searchable
module ActiveStorage
  class Attachment < ActiveRecord::Base
    def self.ransackable_attributes(auth_object = nil)
      ["blob_id", "created_at", "id", "name", "record_id", "record_type"]
    end

    def self.ransackable_associations(auth_object = nil)
      ["blob", "record"]
    end
  end

  class Blob < ActiveRecord::Base
    def self.ransackable_attributes(auth_object = nil)
      ["id", "key", "filename", "content_type", "metadata", "byte_size", "checksum", "created_at"]
    end

    def self.ransackable_associations(auth_object = nil)
   
   ["attachments"]
    end
  end
end
