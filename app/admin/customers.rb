ActiveAdmin.register Customer do
  config.filters = false
  permit_params :full_name, :phone_number, :email_address, :notes, :image

  index do
    selectable_column
    id_column
    column :full_name
    column :phone_number
    column :email_address
    column :created_at
    actions
  end

  form do |f|
    f.inputs "Customer Details" do
      f.input :full_name
      f.input :phone_number
      f.input :email_address
      f.input :notes
      f.input :image, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :full_name
      row :phone_number
      row :email_address
      row :notes
      
      # 直接在这里使用 helper 方法，不需要显式包含
      row "Image" do |customer|
        # 调用 helper 方法
        if customer.image.attached?
          begin
            image_url = rails_blob_path(customer.image, only_path: true)
            image_tag image_url, size: "200x200", 
                      style: "object-fit: cover; border-radius: 8px; max-width: 200px; max-height: 200px;"
          rescue
            image_tag "https://via.placeholder.com/200x200?text=No+Image", size: "200x200"
          end
        else
          image_tag "https://via.placeholder.com/200x200?text=No+Image", size: "200x200"
        end
      end
      
      row :created_at
      row :updated_at
    end
  end
end
