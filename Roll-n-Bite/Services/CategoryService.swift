import UIKit

 enum NetworkError: Error {
    case emptyUrl
    case emptyJson
    case parsingInvalid
}

class CategoryService {
    
    func fetchCategories(completion: @escaping (Result<[Category], NetworkError>) -> Void) {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "apingweb.com"
        urlComponents.path = "/api/rest/36e1f4ea2100bf4384d036b34dbda4d72/categories"
        
        guard let url = urlComponents.url else {
            return completion(.failure(.emptyUrl))
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let urlSession = URLSession(configuration: .default)
        urlSession.dataTask(with: request) { data, response, error in
            guard let data = data else {
                completion(.failure(.emptyJson))
                return
            }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                let categories = try jsonDecoder.decode([Category].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(categories))
                }
            }
            catch {
                print(error)
                completion(.failure(.parsingInvalid))
            }
        }.resume()
    }
}
