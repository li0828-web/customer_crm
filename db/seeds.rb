# Clear existing data
Customer.destroy_all

# Create 5 customers with some missing emails
5.times do |i|
  Customer.create!(
    full_name: "Customer Number #{i+1}",
    phone_number: "555-010#{i+1}",
    email_address: i.even? ? "customer#{i+1}@example.com" : nil,
    notes: "This is a sample note for customer #{i+1}."
  )
end

puts "Created #{Customer.count} customers"

# If you used Devise, create an admin user
if defined?(AdminUser)
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
  puts "Created admin user: admin@example.com / password"
end