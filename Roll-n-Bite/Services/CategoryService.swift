import UIKit

class CategoryService {
    
    func fetchCategories() -> [Category] {
        
        let categories: [Category] = [
            Category(title: "ДОНЕРЫ"),
            Category(title: "КОМБО"),
            Category(title: "ЗАКУСКИ"),
            Category(title: "СОУСЫ"),
            Category(title: "НАПИТКИ"),
            Category(title: "ДЕСЕРТЫ"),
            Category(title: "ТОВАРЫ"),
        ]
        return categories
    }
}
