//
//  OverlapValidationButton.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/06/12.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class OverlapValidationButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func validateOverlappedID(_ id: String?, completion: @escaping (Bool) -> Void) {
        guard let id = id else { return }
        
        NetworkManager.excuteURLSession(
            method: .get,
            from: "\(Endpoints.urlStringUserIDInfo)\(id)", data: nil) { data in
                guard let data = data else { return }
                guard let idResponse = DataCoder.decodeJSONData(
                    type: IDResponse.self,
                    data: data,
                    dateDecodingStrategy: nil
                    ) else { return }
                completion(idResponse.isOverlapped)
        }
    }
}
