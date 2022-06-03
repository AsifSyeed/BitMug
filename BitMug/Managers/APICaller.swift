//
//  APICaller.swift
//  BitMug
//
//  Created by BS901 on 6/3/22.
//

import Foundation

struct Constants {
    static let apiKey = "B221D42D-6982-41DD-A60D-C7FA624A19E4"
    static let baseUrl = "https://rest-sandbox.coinapi.io/v1/"
}

enum APIError: Error {
    case faliedTogetData
}

class APICaller {
    
    static let shared = APICaller()
    
    public func getAllCryptoData(completion: @escaping (Result<[Crypto], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)assets?apikey=\(Constants.apiKey)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode([Crypto].self, from: data)
                
                completion(.success(results))
            } catch {
                completion(.failure(APIError.faliedTogetData))

            }
        }
        task.resume()
    }
}
