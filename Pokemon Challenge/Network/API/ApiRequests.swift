//
//  ApiRequests.swift
//  Pokemon Challenge
//
//  Created by Evens Taian on 19/01/25.
//

import Foundation
import SystemConfiguration

enum ParamsType: String {
    case offset = "offset"
    case limit = "limit"
}

enum MethodsType: String {
    case GET = "GET"
    case POST = "POST"
}

class ApiRequests: APIRequesting {
    private func getConfiguration() -> URLSessionConfiguration {
        
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = [
            "Content-Type" : "application/json"]
        config.requestCachePolicy = .returnCacheDataElseLoad
        return config
    }

    private func getSession() -> URLSession{
        return URLSession(configuration: getConfiguration())
    }
    
    func getSpecies(offset: Int? = 0, limit: Int? = 20, completion: @escaping (Result<SpeciesResponse, NetworkErrors>) -> Void) {
        if let request = buildRequest(endpoint: "pokemon-species", specificUrl: nil, method: .GET, offset: offset, limit: limit) {
            buildResponse(request: request, completion: completion)
        }
    }
    
    func getSpeciesDetails(id: Int, completion: @escaping (Result<SpeciesDetails, NetworkErrors>) -> Void) {
        if let request = buildRequest(endpoint: "pokemon-species/\(id)", specificUrl: nil, method: .GET, offset: nil, limit: nil) {
            buildResponse(request: request, completion: completion)
        }
    }
    
    func getEvolutionChain(urlString: String, completion: @escaping (Result<EvolutionChainDetails, NetworkErrors>) -> Void) {
        if let request = buildRequest(endpoint: nil, specificUrl: urlString, method: .GET, offset: nil, limit: nil) {
            buildResponse(request: request, completion: completion)
        }
    }
}

extension ApiRequests {
    func buildRequest(endpoint: String?, specificUrl: String?, method: MethodsType, offset: Int?, limit: Int?) -> URLRequest?{
        let url = specificUrl ?? "\(ApiConstants.baseURL)\(endpoint!)"
        print(url)
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = method.rawValue
        
        var queryParams : [URLQueryItem] = []
        
        if let offset = offset {
            queryParams.append(URLQueryItem(name: ParamsType.offset.rawValue, value: String(offset)))
        }
        
        if let limit = limit {
            queryParams.append(URLQueryItem(name: ParamsType.limit.rawValue, value: String(limit)))
        }

        guard var components = URLComponents(string: url) else {
            return nil
        }

        components.queryItems = queryParams
        request.url = components.url
        
        return request
    }
    
    func buildResponse<T: Decodable>(request: URLRequest, completion: @escaping (Result<T, NetworkErrors>) -> Void) {
        if !NetworkReachability.isConnectedToNetwork() {
            completion(.failure(.noConnection))
        }
        
        let dataTask = getSession().dataTask(with: request) { data, response, error in
            if error == nil {
                
                do {
                    if let data = data {
                        let charactersResponse = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(charactersResponse))
                    }
                } catch {
                    completion(.failure(.notFound))
                }
            }else{
                if !NetworkReachability.isConnectedToNetwork() {
                    completion(.failure(.noConnection))
                } else {
                    completion(.failure(.notFound))
                }
            }
        }
        
        dataTask.resume()
    }
}

class NetworkReachability {
    static func isConnectedToNetwork() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return isReachable && !needsConnection
    }
}

