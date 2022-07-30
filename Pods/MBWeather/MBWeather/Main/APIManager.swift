//
//  APIManager.swift
//  TestApp
//
//  Created by Mohamed on 28/07/2022.
//

import Foundation


public class WeatherAPIManager {
    
    public static func sendRequest<T: Decodable>(
        endpoint: Endpoint,
        responseModel: T.Type, completion: @escaping (Result<T, RequestError>) -> ()
    ) {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        
        if let items = endpoint.queryParams {
            urlComponents.queryItems = items
        }
        
        guard let url = urlComponents.url else {
            completion(.failure(.missingParams))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header

        if let body = endpoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let response = response as? HTTPURLResponse, let data = data else {
                completion(.failure(.noResponse))
                return
            }
            guard error == nil else {
                completion(.failure(.unknown))
                return
            }
            
            switch response.statusCode {
            case 200...299:
                guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else {
                    completion(.failure(.casting))
                    return
                }
                completion(.success(decodedResponse))
            default:
                completion(.failure(.unknown))
            }
        }.resume()
    }
}
