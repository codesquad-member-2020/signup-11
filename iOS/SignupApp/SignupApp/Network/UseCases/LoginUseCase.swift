//
//  LoginUseCase.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/10/20.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

final class LoginUseCase {
    private let queue = DispatchQueue(label: "login.usecase.queue")
    private let networkDispatcher: NetworkDispatcher
    
    init(networkDispatcher: NetworkDispatcher) {
        self.networkDispatcher = networkDispatcher
    }
    
    func requestIsLogin(with request: LoginRequest, resultHandler: @escaping (Bool) -> Void) {
        queue.async { [weak self] in
            self?.networkDispatcher.excute(request: request) { data in
                guard let data = data else { return }
                guard let loginResponse = DataCoder.decodeJSONData(
                    type: LoginResponse.self,
                    data: data,
                    dateDecodingStrategy: nil
                    ) else { return }
                
                resultHandler(loginResponse.success)
            }
        }
    }
}
