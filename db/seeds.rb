# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)


# Clears previously seeded data
Book.delete_all
User.delete_all

# New seed data
Book.create(    :asin       => "0307887894",
                :isbn       => "978-0307887894",
                :title      => "The Lean Startup: How Today's Entrepreneurs Use Continuous Innovation to Create Radically Successful Businesses",
                :author     => "Eric Ries",
                :image_url  => "http://ecx.images-amazon.com/images/I/51hKCtFdIZL.jpg",
                :amazon_url => "http://www.amazon.com/Lean-Startup-Entrepreneurs-Continuous-Innovation/dp/0307887898%3FSubscriptionId%3DAKIAJKGZZ7G2CHUG2XHA%26tag%3Dwwwbronsteior-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D0307887898")

Book.create(    :asin       => "1400066407",
                :isbn       => "978-1400066407",
                :title      => "Super Sad True Love Story: A Novel",
                :author     => "Gary Shteyngart",
                :image_url  => "http://ecx.images-amazon.com/images/I/510jnPKfu5L.jpg",
                :amazon_url => "http://www.amazon.com/Super-Sad-True-Love-Story/dp/0812977866%3FSubscriptionId%3DAKIAJKGZZ7G2CHUG2XHA%26tag%3Dwwwbronsteior-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D0812977866")

Book.create(    :asin       => "0307888686",
                :isbn       => "978-0307888686",
                :title      => "World War Z: An Oral History of the Zombie War",
                :author     => "Max Brooks",
                :image_url  => "http://ecx.images-amazon.com/images/I/51k8wTBELLL.jpg",
                :amazon_url => "http://www.amazon.com/World-War-Oral-History-Zombie/dp/0307888681%3FSubscriptionId%3DAKIAJKGZZ7G2CHUG2XHA%26tag%3Dwwwbronsteior-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D0307888681")

Book.create(    :asin       => "031603441X",
                :isbn       => "978-031603441X",
                :title      => "Life",
                :author     => "Keith Richards",
                :image_url  => "http://ecx.images-amazon.com/images/I/51lm1XjuiEL.jpg",
                :amazon_url => "http://www.amazon.com/Life-Keith-Richards/dp/031603441X%3FSubscriptionId%3DAKIAJKGZZ7G2CHUG2XHA%26tag%3Dwwwbronsteior-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D031603441X")

Book.create(    :asin       => "1613821174",
                :isbn       => "978-1613821174",
                :title      => "Ulysses",
                :author     => "James Joyce",
                :image_url  => "http://ecx.images-amazon.com/images/I/51XwKnaG9mL.jpg",
                :amazon_url => "http://www.amazon.com/Ulysses-James-Joyce/dp/1613821174%3FSubscriptionId%3DAKIAJKGZZ7G2CHUG2XHA%26tag%3Dwwwbronsteior-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D1613821174")

Book.create(    :asin       => "0547247966",
                :isbn       => "978-0547247966",
                :title      => "Whatever It Takes: Geoffrey Canada's Quest to Change Harlem and America",
                :author     => "Paul Tough",
                :image_url  => "http://ecx.images-amazon.com/images/I/51nXIy6rj-L.jpg",
                :amazon_url => "http://www.amazon.com/Whatever-Takes-Geoffrey-Canadas-America/dp/0547247966%3FSubscriptionId%3DAKIAJKGZZ7G2CHUG2XHA%26tag%3Dwwwbronsteior-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D0547247966")


Book.create(    :asin       => "1907590285",
                :isbn       => "978-1907590285",
                :title      => "The Plague",
                :author     => "Albert Camus",
                :image_url  => "http://ecx.images-amazon.com/images/I/31VRx5Lg0dL.jpg",
                :amazon_url => "http://www.amazon.com/Plague-Albert-Camus/dp/1907590285%3FSubscriptionId%3DAKIAJKGZZ7G2CHUG2XHA%26tag%3Dwwwbronsteior-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D1907590285")

Book.create(    :asin       => "0743236017",
                :isbn       => "978-0743236017",
                :title      => "Sex, Drugs, and Cocoa Puffs: A Low Culture Manifesto",
                :author     => "Chuck Klosterman",
                :image_url  => "http://ecx.images-amazon.com/images/I/51NtTYShSnL.jpg",
                :amazon_url => "http://www.amazon.com/Sex-Drugs-Cocoa-Puffs-Manifesto/dp/0743236017%3FSubscriptionId%3DAKIAJKGZZ7G2CHUG2XHA%26tag%3Dwwwbronsteior-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D0743236017")

Book.create(    :asin       => "0061473081",
                :isbn       => "978-0061473081",
                :title      => "Hammer of the Gods: The Led Zeppelin Saga",
                :author     => "Stephen Davis",
                :image_url  => "http://ecx.images-amazon.com/images/I/51HYXXeOjSL.jpg",
                :amazon_url => "http://www.amazon.com/Hammer-Gods-Led-Zeppelin-Saga/dp/0061473081%3FSubscriptionId%3DAKIAJKGZZ7G2CHUG2XHA%26tag%3Dwwwbronsteior-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D0061473081")

Book.create(    :asin       => "1573225517",
                :isbn       => "978-1573225517",
                :title      => "High Fidelity",
                :author     => "Nick Hornby",
                :image_url  => "http://ecx.images-amazon.com/images/I/41WBVCjhh-L.jpg",
                :amazon_url => "http://www.amazon.com/High-Fidelity-Nick-Hornby/dp/1573225517%3FSubscriptionId%3DAKIAJKGZZ7G2CHUG2XHA%26tag%3Dwwwbronsteior-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D1573225517")

Book.create(    :asin       => "0446692824",
                :isbn       => "978-0446692824",
                :title      => "Vice Dos and Don'ts: 10 Years of VICE Magazine's Street Fashion Critiques",
                :author     => "Suroosh Alvi",
                :image_url  => "http://ecx.images-amazon.com/images/I/51VbZGHLDiL.jpg",
                :amazon_url => "http://www.amazon.com/Vice-Dos-Donts-Magazines-Critiques/dp/0446692824%3FSubscriptionId%3DAKIAJKGZZ7G2CHUG2XHA%26tag%3Dwwwbronsteior-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D0446692824")


#User Seeds
User.create(    :email => "john@example.com",
                :password => "secret",
                :first => "John",
                :last => "Smith")

User.create(    :email => "tom@example.com",
                :password => "secret",
                :first => "Tom",
                :last => "Jones")

User.create(    :email => "frank@example.com",
                :password => "secret",
                :first => "Frank",
                :last => "Drake")

User.create(    :email => "jeff@example.com",
                :password => "secret",
                :first => "Jeff",
                :last => "Winger")

User.create(    :email => "britta@example.com",
                :password => "secret",
                :first => "Britta",
                :last => "Perry")

User.create(    :email => "abed@example.com",
                :password => "secret",
                :first => "Abed",
                :last => "Nadir")

