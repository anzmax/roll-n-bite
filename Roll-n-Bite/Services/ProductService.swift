import UIKit

class ProductService {
    
    func fetchProducts() -> [Product] {
        var products: [Product] = [
            Product(title: "аджика", price: "239", image: UIImage(named: "аджика")),
            Product(title: "баварский", price: "239", image: UIImage(named: "баварский")),
            Product(title: "берлинский", price: "239", image: UIImage(named: "берлинский")),
            Product(title: "греческий", price: "239", image: UIImage(named: "греческий")),
            Product(title: "грибной", price: "239", image: UIImage(named: "грибной")),
            Product(title: "овощной", price: "239", image: UIImage(named: "овощной")),
            Product(title: "сырный", price: "239", image: UIImage(named: "сырный"))
        ]
        return products
    }
}
