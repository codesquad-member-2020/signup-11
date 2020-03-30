//
//  Network.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/27.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

final class NetworkManager {
    private static let jsonType = "application/json"
    private static let headerContentType = "Content-Type"
    private static let headerAccept = "Accept"
    
    enum HTTPMethod: String, CustomStringConvertible {
        case get = "GET"
        case post = "POST"
        var description: String {
            return self.rawValue
        }
    }
    
    static func excuteURLSession(method: HTTPMethod,
                                 from urlString: String,
                                 data: Data?,
                                 completionHandler: @escaping (Data?) -> ()) {
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = method.description
        request.httpBody = data
        request.addValue(jsonType, forHTTPHeaderField: headerContentType)
        request.addValue(jsonType, forHTTPHeaderField: headerAccept)
        URLSession.shared.dataTask(with: request) { (data, urlResponse, error) in
            guard error == nil else { return }
            guard let data = data else { return }
            completionHandler(data)
        }.resume()
    }
}
