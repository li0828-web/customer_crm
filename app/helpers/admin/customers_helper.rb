module Admin::CustomersHelper
  def safe_customer_image(customer, size: [50, 50])
    if customer.image.attached?
      begin
        # Try to generate a URL without triggering association errors
        url = Rails.application.routes.url_helpers.rails_representation_url(
          customer.image.variant(resize_to_limit: size).processed,
          only_path: true
        )
        image_tag url, style: "object-fit: cover; border-radius: 4px; width: #{size.first}px; height: #{size.last}px;"
      rescue => e
        # Fallback to placeholder on error
        image_tag "https://via.placeholder.com/#{size.first}x#{size.last}", 
                  size: "#{size.first}x#{size.last}", 
                  style: "object-fit: cover; border-radius: 4px;"
      end
    else
      # No image attached, show placeholder
      image_tag "https://via.placeholder.com/#{size.first}x#{size.last}", 
                size: "#{size.first}x#{size.last}", 
                style: "object-fit: cover; border-radius: 4px;"
    end
  end
end

