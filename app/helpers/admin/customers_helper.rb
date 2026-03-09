module Admin::CustomersHelper
  def safe_admin_customer_image(customer, size: [200, 200])
    # 安全地检查图片
    if customer.image.attached?
      begin
        # 使用 rails_blob_path 安全地获取URL
        image_url = rails_blob_path(customer.image, only_path: true)

        if size == [200, 200]
          image_tag image_url, size: "200x200",
                    style: "object-fit: cover; border-radius: 8px; max-width: 200px; max-height: 200px;"
        else
          image_tag image_url, size: "50x50",
                    style: "object-fit: cover; border-radius: 4px; width: 50px; height: 50px;"
        end
      rescue => e
        # 出错时显示占位图
        if size == [200, 200]
          image_tag "https://via.placeholder.com/200x200?text=Image+Error",
                    size: "200x200"
        else
          image_tag "https://via.placeholder.com/50x50?text=Error",
                    size: "50x50"
        end
      end
    else
      # 没有图片时显示占位图
      if size == [200, 200]
        image_tag "https://via.placeholder.com/200x200?text=No+Image",
                  size: "200x200"
      else
        image_tag "https://via.placeholder.com/50x50?text=No+Image",
                  size: "50x50"
      end
    end
  end
end

