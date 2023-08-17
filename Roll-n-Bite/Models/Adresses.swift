import UIKit

public struct Adress {
    var location: String
    var schedule: String
}

public var ruAdresses: [Adress] = [
    
    Adress(location: "Москва, Тверская Застава 7", schedule: "работает с 08:00 - 23:00"),
    Adress(location: "Москва, Ленинская слобода 19", schedule: "работает с 09:00 - 20:00"),
    Adress(location: "Санкт-Петербург, Суворовский 56", schedule: "работает с 09:00 - 22:00"),
    Adress(location: "Ульяновск, Гончарова 36", schedule: "работает с 09:00 - 22:00"),
    Adress(location: "Новый Уренгой, Мирный 6/2", schedule: "работает с 09:00 - 23:00")
]

public var kzAdresses: [Adress] = [
    Adress(location: "Алматы, Тимирязева 38/1", schedule: "работает с 10:00 - 00:00")
]


