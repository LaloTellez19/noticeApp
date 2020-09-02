//
//  loginInteractor.swift
//  noticeApp
//
//  Created by Miguel Eduardo Valdez Tellez on 08/25/2020.
//  Copyright © 2020 Linko. All rights reserved.
//

import Foundation

class loginInteractor: loginInteractorInputProtocol {
    func login(usuario: String, contraseña: String) -> Bool {
        manager.login(usuario: usuario, contraseña: contraseña)
    }
    

    weak var presenter: loginInteractorOutputProtocol?
    private let manager = coreDataManager()
    init() {}
}
