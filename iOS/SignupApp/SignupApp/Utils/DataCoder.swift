//
//  DataDecoder.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/27.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

final class DataCoder {
    static func decodeJSONData<T>(type: T.Type,
                                  data: Data,
                                  dateDecodingStrategy: JSONDecoder.DateDecodingStrategy?) -> T?
        where T: Decodable {
            let jsonDecoder: JSONDecoder = {
                let jsonDecoder = JSONDecoder()
                if let dateDecodingStrategy = dateDecodingStrategy {
                    jsonDecoder.dateDecodingStrategy = dateDecodingStrategy
                }
                return jsonDecoder
            }()
            guard let T = try? jsonDecoder.decode(T.self, from: data) else { return nil }
            return T
    }
    
    static func encodeJSONData<T>(_ value: T) -> Data? where T: Encodable {
        guard let jsonData = try? JSONEncoder().encode(value) else { return nil }
        return jsonData
    }
}
