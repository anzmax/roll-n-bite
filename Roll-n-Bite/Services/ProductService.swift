import UIKit

enum NetworkErrors: Error {
    case emptyUrl
    case emptyJson
    case parsingInvalid
}

class ProductService {
 
    func fetchProducts(completion: @escaping (Result<[Product], NetworkErrors> ) -> Void) {
        
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

