# Seeds

Category.destroy_all

category = Category.create({
  name: 'Cervejas',
  description: 'Conheça nossas cervejas artesanais'
})

p "Created #{Category.count} Categories!"

Product.destroy_all

Product.create({
  name: 'Heineken',
  price: 6.0,
  quantity: 202,
  image: 'http://localhost:3000/uploads/heineken.jpg',
  category: category
})

Product.create({
  name: 'Budweiser',
  price: 5.5,
  quantity: 121,
  image: 'http://localhost:3000/uploads/budweiser.jpg',
  category: category
})

Product.create({
  name: 'Eisenbahn',
  price: 5.0,
  quantity: 2,
  image: 'http://localhost:3000/uploads/eisenbahn.jpg',
  category: category
})

Product.create({
  name: 'Antarctica Original',
  price: 6.0,
  quantity: 24,
  image: 'http://localhost:3000/uploads/antarctica-original.jpg',
  category: category
})

Product.create({
  name: 'Bohemia',
  price: 7.0,
  quantity: 139,
  image: 'http://localhost:3000/uploads/bohemia.jpg',
  category: category
})

p "Created #{Product.count} Products!"
