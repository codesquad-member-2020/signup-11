//
//  UserCreationUseCase.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/10/20.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

final class UserCreationUseCase {
    private let queue = DispatchQueue(label: "user.creation.queue")
    private let networkDispatcher: NetworkDispatcher
    
    init(networkDispatcher: NetworkDispatcher) {
        self.networkDispatcher = networkDispatcher
    }
    
    func createUser(with request: Request, resultHandler: @escaping (Bool) -> Void) {
        queue.async { [weak self] in
            self?.networkDispatcher.excute(request: request) { data in
                guard let data = data else { return }
                guard let createUserResponse = DataCoder.decodeJSONData(
                    type: CreateUserResponse.self,
                    data: data,
                    dateDecodingStrategy: nil) else { return }
                
                resultHandler(createUserResponse.success)
            }
        }
    }
}
