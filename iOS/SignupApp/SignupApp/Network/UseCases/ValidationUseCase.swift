//
//  ValidationUseCase.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/10/20.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

final class ValidationUseCase {
    private let queue = DispatchQueue(label: "validation.usecase.queue")
    private let networkDispatcher: NetworkDispatcher
    
    init(networkDispatcher: NetworkDispatcher) {
        self.networkDispatcher = networkDispatcher
    }

    func validateIsOverlapped(with request: ValidationRequest, resultHandler: @escaping (Bool) -> Void) {
        queue.sync { [weak self] in
            self?.networkDispatcher.excute(request: request) { data in
                guard let data = data else { return }
                guard let idResponse = DataCoder.decodeJSONData(
                    type: IDResponse.self,
                    data: data,
                    dateDecodingStrategy: nil
                    ) else { return }
                
                resultHandler(idResponse.isOverlapped)
            }
        }
    }
}
