//
//  RMService.swift
//  RickAndMorty
//
//  Created by Kishan Kr Sharma on 4/23/23.
//

import Foundation

/// Primary api service object to get Rick and Morty data
final class RMService {
    /// Shared singleton instance
    static let shared = RMService()
    /// Privatized constructor
    private init () {}
    private let cacheManager = RMApiCacheManager()
    
    enum RMServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    /// Send Rick and Morty API Call
    /// - Parameters:
    ///   - request: Request instance
    ///   - completion: Callback with data or error
    ///   - type: The type of object we expect to get back
    public func execute<T: Codable>(
        _ request: RMRequest,
        expecting type: T.Type,
        completion: @escaping(Result<T, Error>) -> Void) {
            
            if let cachedData = cacheManager.cachedResponse(for: request.endpoint, url: request.url) {
                do {
                    print("using cashed api response.....")
                    let result = try JSONDecoder().decode(type.self, from: cachedData)
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
                return
            }
            
            guard let urlRequest = self.request(from: request) else {
                completion(.failure(RMServiceError.failedToCreateRequest))
                return
            }
            
            let task = URLSession.shared.dataTask(with: urlRequest){ [weak self] data, _, error in
                guard let data = data, error == nil else {
                    completion(.failure(error ?? RMServiceError.failedToGetData))
                    return
                }
                
                // Decode response
                do {
                    let result = try JSONDecoder().decode(type.self, from: data)
                    self?.cacheManager.setCache(
                        for: request.endpoint,
                        url: request.url,
                        data: data
                    )
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
            }
            
            task.resume()
    }
    
    // MARK:- Private
    private func request(from rmRequest: RMRequest) -> URLRequest?{
        guard let url = rmRequest.url else{
            return nil
        }
        var request =  URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        return request
        
    }
}
