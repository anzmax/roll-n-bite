import UIKit

class ProductService {
    
    func fetchProducts() -> [Product] {
        var products: [Product] = [
            Product(title: "аджика", price: "239", weight: "250", image: UIImage(named: "аджика")),
            Product(title: "баварский", price: "239", weight: "250", image: UIImage(named: "баварский")),
            Product(title: "берлинский", price: "239", weight: "250", image: UIImage(named: "берлинский")),
            Product(title: "греческий", price: "239", weight: "250", image: UIImage(named: "греческий")),
            Product(title: "грибной", price: "239", weight: "250", image: UIImage(named: "грибной")),
            Product(title: "овощной", price: "239",weight: "250", image: UIImage(named: "овощной")),
            Product(title: "сырный", price: "239", weight: "250", image: UIImage(named: "сырный")),
            Product(title: "тейсти", price: "239", weight: "250", image: UIImage(named: "тейсти")),
            Product(title: "утренний с беконом", price: "239", weight: "250", image: UIImage(named: "утренний-с-беконом")),
            Product(title: "утренний", price: "239", weight: "250", image: UIImage(named: "утренний")),
            Product(title: "со свежими огурцами", price: "239", weight: "250", image: UIImage(named: "фирм-свеж")),
            Product(title: "со солеными огурцами", price: "239", weight: "250", image: UIImage(named: "фирм-сол")),
            Product(title: "фирменный", price: "239", weight: "250", image: UIImage(named: "фирменный")),
        ]
        return products
    }
}
