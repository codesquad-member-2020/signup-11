//
//  DataDecoder.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/27.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

final class DataCoder {
    static func decodeJSONData<T>(from urlString: String,
                                  type: T.Type,
                                  dateDecodingStrategy: JSONDecoder.DateDecodingStrategy?,
                                  completionHandler: @escaping (T?) -> ())
        where T: Decodable {
            Network.excuteURLSession(from: urlString) { (data) in
                guard let data = data else { return }
                let jsonDecoder: JSONDecoder = {
                    let jsonDecoder = JSONDecoder()
                    if let dateDecodingStrategy = dateDecodingStrategy {
                        jsonDecoder.dateDecodingStrategy = dateDecodingStrategy
                    }
                    return jsonDecoder
                }()
                if let T = try? jsonDecoder.decode(T.self, from: data) {
                    completionHandler(T)
                }
            }
    }
    
    static func encodeJSONData<T>(_ value: T) -> Data? where T: Encodable {
        guard let jsonData = try? JSONEncoder().encode(value) else { return nil }
        return jsonData
    }
}
