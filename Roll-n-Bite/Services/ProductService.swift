import UIKit

class ProductService {
    
    func fetchProducts() -> [Product] {
        var products: [Product] = [
            Product(title: "Аджика", price: "239", weight: "250", image: UIImage(named: "аджика")),
            Product(title: "Баварский", price: "239", weight: "250", image: UIImage(named: "баварский")),
            Product(title: "Берлинский", price: "239", weight: "250", image: UIImage(named: "берлинский")),
            Product(title: "Греческий", price: "239", weight: "250", image: UIImage(named: "греческий")),
            Product(title: "Грибной", price: "239", weight: "250", image: UIImage(named: "грибной")),
            Product(title: "Овощной", price: "239",weight: "250", image: UIImage(named: "овощной")),
            Product(title: "Сырный", price: "239", weight: "250", image: UIImage(named: "сырный")),
            Product(title: "Тейсти", price: "239", weight: "250", image: UIImage(named: "тейсти")),
            Product(title: "Утренний с беконом", price: "239", weight: "250", image: UIImage(named: "утренний-с-беконом")),
            Product(title: "Утренний", price: "239", weight: "250", image: UIImage(named: "утренний")),
            Product(title: "Со свежими огурцами", price: "239", weight: "250", image: UIImage(named: "фирм-свеж")),
            Product(title: "С солеными огурцами", price: "239", weight: "250", image: UIImage(named: "фирм-сол")),
            Product(title: "Фирменный", price: "239", weight: "250", image: UIImage(named: "фирменный")),
            Product(title: "Кебстер комбо", price: "239", weight: "250", image: UIImage(named: "кебстер")),
            Product(title: "Донер и напиток", price: "239", weight: "250", image: UIImage(named: "донер-напиток")),
            Product(title: "Донер, картошка и напиток", price: "239", weight: "250", image: UIImage(named: "донер-карт-нап")),
            Product(title: "Комбо с супом", price: "239", weight: "250", image: UIImage(named: "с-супом")),
        ]
        return products
    }
}
