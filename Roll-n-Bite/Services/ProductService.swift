import UIKit

enum NetworkErrors: Error {
    case emptyUrl
    case emptyJson
    case parsingInvalid
}

class ProductService {
 
    func fetchProducts(completion: @escaping (Result<[Product], NetworkErrors> ) -> Void) {
        
        //https://apingweb.com/api/rest/ffd6ac8566a6ea1f262606f0a541857919/products
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "apingweb.com"
        urlComponents.path = "/api/rest/ffd6ac8566a6ea1f262606f0a541857919/products"
        
        guard let url = urlComponents.url else {
            completion(.failure(.emptyUrl))
            return
        }
        
        print(url)
        
        var request = URLRequest.init(url: url)
        request.httpMethod = "GET"
        
        let urlSession = URLSession(configuration: .default)
        
        urlSession.dataTask(with: request) { data, response, error in
            
            guard let data = data else {
                completion(.failure(.emptyJson))
                return
            }
            
            let jsonDecoder = JSONDecoder()

            
            do {
                let products = try jsonDecoder.decode([Product].self, from: data)
                
                DispatchQueue.main.async {
                    completion(.success(products))
                }
                
                
            } catch {
                print(error)
                completion(.failure(.parsingInvalid))
            }
            
           
        }.resume()
    }
}
    
//    func fetchProducts() -> [Product] {
//        let products: [Product] = [
//            Product(id: 1, title: "Аджика", price: "239", weight: "250", image: "аджика"),
//            Product(id: 2, title: "Баварский", price: "239", weight: "250", image: "баварский"),
//            Product(id: 3, title: "Берлинский", price: "239", weight: "250", image: "берлинский"),
//            Product(id: 4, title: "Греческий", price: "239", weight: "250", image: "греческий"),
//            Product(title: "Грибной", price: "239", weight: "250", image: "грибной"),
//            Product(title: "Овощной", price: "239",weight: "250", image: "овощной"),
//            Product(title: "Сырный", price: "239", weight: "250", image: "сырный"),
//            Product(title: "Тейсти", price: "239", weight: "250", image: "тейсти"),
//            Product(title: "Утренний с беконом", price: "239", weight: "250", image: UIImage(named: "утренний-с-беконом")),
//            Product(title: "Утренний", price: "239", weight: "250", image: UIImage(named: "утренний")),
//            Product(title: "Со свежими огурцами", price: "239", weight: "250", image: UIImage(named: "фирм-свеж")),
//            Product(title: "С солеными огурцами", price: "239", weight: "250", image: UIImage(named: "фирм-сол")),
//            Product(title: "Фирменный", price: "239", weight: "250", image: UIImage(named: "фирменный")),
//            Product(title: "Кебстер комбо", price: "239", weight: "250", image: UIImage(named: "кебстер")),
//            Product(title: "Донер и напиток", price: "239", weight: "250", image: UIImage(named: "донер-напиток")),
//            Product(title: "Донер, картошка и напиток", price: "239", weight: "250", image: UIImage(named: "донер-карт-нап")),
//            Product(title: "Комбо с супом", price: "239", weight: "250", image: UIImage(named: "с-супом")),
//        ]
//        return products
//    }
//}

//https://apingweb.com/api/rest/ffd6ac8566a6ea1f262606f0a541857919/products
