//
//  createAccountInteractor.swift
//  noticeApp
//
//  Created by Miguel Eduardo Valdez Tellez on 08/25/2020.
//  Copyright © 2020 Linko. All rights reserved.
//

import Foundation

class createAccountInteractor: createAccountInteractorInputProtocol {
    func login(usuario: String, contraseña: String) {
        manager.login(usuario: usuario, contraseña: contraseña)
    }
    
    func validarUsuario(usuario: String, completion: @escaping (Bool) -> Void) {
        manager.usuarioExiste(usuario: usuario, completion: completion)
    }
    
    
    
    
    
    weak var presenter: createAccountInteractorOutputProtocol?
    private var manager = coreDataManager.shared
    init() {}
}
