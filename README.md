Features
Customer Model

The Customer model includes the following attributes:

Full Name

Phone Number

Email Address

Notes

Image (uploaded with ActiveStorage)

Validations

The model includes basic validations:

full_name must be present

phone_number must be present

email_address must be a valid email format (optional)

Admin Interface

The project uses ActiveAdmin to manage customers.

Admin users can:

Create customers

Edit customers

Delete customers

Upload customer images

View customer records

Admin panel location:

/admin
Customer Views

The application includes a public-facing customer controller with three pages.

All Customers

Displays all customers in the database.

URL:

/
Alphabetized Customers

Displays customers sorted by full name.

URL:

/customers/alphabetized
Customers Missing Email

Displays customers who do not have an email address.

URL:

/customers/missing_email
Customer Partial

Customer information is rendered using a Rails partial:

app/views/customers/_customer.html.erb

Each customer card displays:

Customer image

Full name

Phone number

Email address

Notes

Routes

Routes used in the project:

root "customers#index"

get "customers/alphabetized", to: "customers#alphabetized"
get "customers/missing_email", to: "customers#missing_email"
Setup Instructions
1. Clone the repository
git clone <my-repository-url>
cd customer_crm
2. Install dependencies
bundle install
3. Setup database
rails db:create
rails db:migrate
4. Setup ActiveStorage
rails active_storage:install
rails db:migrate
5. Start the server
rails server

Then open:

http://localhost:3000

Admin panel:

http://localhost:3000/admin
