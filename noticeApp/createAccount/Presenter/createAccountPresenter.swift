//
//  createAccountPresenter.swift
//  noticeApp
//
//  Created by Miguel Eduardo Valdez Tellez on 08/25/2020.
//  Copyright © 2020 Linko. All rights reserved.
//

import Foundation

class createAccountPresenter: createAccountPresenterProtocol, createAccountInteractorOutputProtocol {
    
    func validarUsuario(usuario: String, completion: @escaping(Bool)->Void) {
        interactor?.validarUsuario(usuario: usuario, completion: completion)
    }
    
    weak var view: createAccountViewProtocol?
    var interactor: createAccountInteractorInputProtocol?
    var wireFrame: createAccountWireFrameProtocol?
    
    init() {}
}
