
  name  = "Nhà xuất bản Lao Động"
  Publisher.create!(name: name)
  name  = "Nhà xuất bản Kim Đồng"
  Publisher.create!(name: name)

  title = "Sách nước ngoài"
  parentid = 0
  Category.create!(title: title, parentid: parentid)
  title = "Sách Việt Nam"
  parentid = 0
  Category.create!(title: title, parentid: parentid)

  title = "Sách cách mạng"
  parentid = 1
  Category.create!(title: title, parentid: parentid)

  email = "phuocnaldo92@gmail.com"
  role = 0
  password = "12345678"
  User.create!(email: email, role: role, password: password)
