user1 = User.create!(
  email: "bob@email.com",
  password: "password",
  username: "Bob",
  phone_number: "9019999999",
  role: "Sales Rep"
)

admin1 = Admin.create!(
    email: "admin@email.com",
    password: "password"
)

cat1 = Category.create!(
    name: 'tools'
)
item1 = Product.create!(
    name: 'scalpel',
    description: 'it cuts or something',
    category: cat1
)
item2 = Product.create!(
    name: 'stitches',
    description: 'sew em up',
    category: cat1
)