//
//  loginPresenter.swift
//  noticeApp
//
//  Created by Miguel Eduardo Valdez Tellez on 08/25/2020.
//  Copyright © 2020 Linko. All rights reserved.
//

import Foundation

class loginPresenter: loginPresenterProtocol, loginInteractorOutputProtocol {
    func login(usuario: String, contraseña: String) -> Bool {
        (interactor?.login(usuario: usuario, contraseña: contraseña))!
    }
    
    func cambioPubli(usuario: String) {
        wireFrame?.cambioPubli(controlador: view!, usuario: usuario)
    }
    
    func cambioCreateAccount() {
        wireFrame?.cambioCreateAccount(contralador: view!)
    }
    
    weak var view: loginViewProtocol?
    var interactor: loginInteractorInputProtocol?
    var wireFrame: loginWireFrameProtocol?
    
    init() {}
}
