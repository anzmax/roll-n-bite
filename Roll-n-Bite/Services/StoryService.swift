import UIKit

enum NetworkError2: Error {
   case emptyUrl
   case emptyJson
   case parsingInvalid
}

class StoryService {
    
    func fetchStories(completion: @escaping (Result<[Story], NetworkError2>) -> Void) {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "apingweb.com"
        urlComponents.path = "/api/rest/c4a2c655e66737a857f3a4d9d8b3e8fc22/stories"
        
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
                let stories = try jsonDecoder.decode([Story].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(stories))
                }
            }
            catch {
                print(error)
                completion(.failure(.parsingInvalid))
            }
        }.resume()
    }
}
