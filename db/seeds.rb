
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

  name = "Nhà thơ tình tuyệt vọng"
  sub_name = "Tuyệt vọng nhà thơ tình"
  birth_date = "1955/5/5"
  style = "Thơ tự do"

  Author.create!(name: name, sub_name: sub_name, birth_date: birth_date, style: style)
