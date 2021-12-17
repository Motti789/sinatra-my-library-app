# seed data to make sure my database association is working

motti = User.create(name: "Motti", email: "mchillywilly@gmail.com", password: "password")
yitty = User.create(name: "Yitty", email: "yitrendler@gmail.com", password: "password")

BookEntry.create(title: "Sefer Hamamorim", author: "Chabad Rebbe", genre: "Chassidus", user_id: motti.id)

motti.book_entries.create(title: "Sefer Hasichos")

yittys_entry = yitty.book_entries.build(title: "sichos")
yittys_entry.save
