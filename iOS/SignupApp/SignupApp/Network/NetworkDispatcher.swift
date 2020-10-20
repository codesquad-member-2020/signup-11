//
//  NetworkDispatcher.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/10/20.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

protocol NetworkDispatcher {
    func excute(request: Request, completionHandler: @escaping (Data?) -> Void)
}
