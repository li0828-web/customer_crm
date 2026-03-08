ActiveAdmin.register Customer do
  config.filters = false
  permit_params :full_name, :phone_number, :email_address, :notes, :image

  index do
    selectable_column
    id_column
    column :full_name
    column :phone_number
    column :email_address

    column "Image" do |customer|
      if customer.image.attached?
        begin
          # Generate URL safely
          url = Rails.application.routes.url_helpers.rails_representation_url(
            customer.image.variant(resize_to_limit: [50, 50]).processed,
            only_path: true
          )
          image_tag url, style: "object-fit: cover; border-radius: 4px; width: 50px; height: 50px;"
        rescue
          image_tag "https://via.placeholder.com/50", size: "50x50"
        end
      else
        image_tag "https://via.placeholder.com/50", size: "50x50"
      end
    end

    column :created_at
    actions
  end

  form do |f|
    f.inputs "Customer Details" do
      f.input :full_name
      f.input :phone_number
      f.input :email_address
      f.input :notes
      f.input :image, as: :file, 
                hint: f.object.image.attached? ? 
                  "Current: #{image_tag f.object.image.variant(resize_to_limit: [50, 50])}".html_safe : 
                  "Upload a customer photo"
    end
    f.actions
  end

  show do
    attributes_table do
      row :full_name
      row :phone_number
      row :email_address
      row :notes
      
      row "Image" do |customer|
        if customer.image.attached?
          image_tag customer.image.variant(resize_to_limit: [200, 200])
        else
          image_tag "https://via.placeholder.com/200"
        end
      end
      
      row :created_at
      row :updated_at
    end
  end
end
