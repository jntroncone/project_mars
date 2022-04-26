admin1 = Admin.create!(
    email: "admin@email.com",
    password: "password"
)

item1 = Product.create!(
    name: 'scalpel',
    description: 'it cuts or something'
)

item2 = Product.create!(
    name: 'stitches',
    description: 'sew em up'
)
user1 = User.create!(
  email: "bob@email.com",
  password: "password",
  username: "Bob",
  phone_number: "9019999999",
  role: "Sales Rep"
)
