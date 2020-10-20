//
//  Network.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/27.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

final class NetworkManager: NetworkDispatcher {
    private let urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func excute(request: Request, completionHandler: @escaping (Data?) -> Void) {
        guard let request = request.urlRequest() else { return }
        
        urlSession.dataTask(with: request) { (data, urlResponse, error) in
            guard error == nil else { return }
            guard let data = data else { return }
            
            completionHandler(data)
        }.resume()
    }
}
