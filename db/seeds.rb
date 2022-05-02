admin1 = Admin.create!(
    email: "admin@email.com",
    password: "password"
)

item1 = Product.create!(
    name: 'Test Item 1',
    description: 'Description here'
)

item2 = Product.create!(
    name: 'Test Item 2',
    description: 'Description here'
)
user1 = User.create!(
  email: "test@email.com",
  password: "password",
  username: "TestUser",
  phone_number: "9019999999",
  role: "Sales Representative"
)
