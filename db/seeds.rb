# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Shop.create([
        {name: 'CafeArte', latitude: 35.838187, longtitude: 128.755047},
        {name: 'BomBom', latitude: 35.839632, longtitude: 128.757311},
        {name: 'Lee', latitude: 35.840433, longtitude: 128.758674},
        {name: 'Starbucks', latitude: 35.836996, longtitude: 128.753093},
        {name: 'Lotteria', latitude: 35.836877, longtitude: 128.753303},
        {name: 'MassCoffee', latitude: 35.836617, longtitude: 128.753080},
        {name: 'YU', latitude: 35.832234, longtitude: 128.757564},
        {name: 'BBQ', latitude: 35.838877, longtitude: 128.755481},
        {name: 'Dongsungro1', latitude: 35.867522, longtitude: 128.596669},
        {name: 'Dongsungro2', latitude: 35.867236, longtitude: 128.597856},
        {name: "탐앤탐스 강서구청사거리점", latitude: 37.556723, longtitude: 126.851552},
        {name: "커피룻", latitude: 37.558758, longtitude: 126.846249},
        {name: "카페마로네", latitude: 37.558988, longtitude: 126.846172},
        {name: "스타벅스", latitude: 37.555282, longtitude: 126.851056},
        {name: "이디야 카페", latitude: 37.559499, longtitude: 126.845756},
        {name: "할리스", latitude: 37.552426, longtitude: 126.851288},
        {name: "엔젤리너스", latitude: 37.554263, longtitude: 126.851031},
        {name: "CU", latitude: 37.556751, longtitude: 126.847722},
        {name: "GS25", latitude: 37.555557, longtitude: 126.848215},
        {name: "CU2", latitude: 37.556892, longtitude: 126.850921}
        ])
for i in 1..20
Product.create(
    [
        {shop_id: i, price: 4500, name: 'Ice Americano'},
        {shop_id: i, price: 5000, name: 'Vanilla Latte'},
        {shop_id: i, price: 3400, name: 'Toffee Nut Latte'},
        {shop_id: i, price: 5500, name: 'Cinnamon Dolce Latte'},
        {shop_id: i, price: 2000, name: 'Espresso'},
        {shop_id: i, price: 3200, name: 'Herb Tea'},
        {shop_id: i, price: 4000, name: 'Dutch Coffee'},
        {shop_id: i, price: 3900, name: 'Mint Choco Latte'},
        {shop_id: i, price: 3500, name: 'Lemon Tea'}
        ])
end
for j in 1..20
User.create(
  [
    {email: "#{j}@aa", username: j, password: 123456, password_confirmation: 123456}    
    ])
end
