//
//  createAccountProtocols.swift
//  noticeApp
//
//  Created by Miguel Eduardo Valdez Tellez on 08/25/2020.
//  Copyright © 2020 Linko. All rights reserved.
//

import Foundation

protocol createAccountViewProtocol: class {
    var presenter: createAccountPresenterProtocol? { get set }
    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
}

protocol createAccountWireFrameProtocol: class {
    static func presentcreateAccountModule(fromView vc: AnyObject)
    /**
     * Add here your methods for communication PRESENTER -> WIREFRAME
     */
}

protocol createAccountPresenterProtocol: class {
    var view: createAccountViewProtocol? { get set }
    var interactor: createAccountInteractorInputProtocol? { get set }
    var wireFrame: createAccountWireFrameProtocol? { get set }
    /**
     * Add here your methods for communication VIEW -> PRESENTER
     */
    func validarUsuario(usuario: String, completion: @escaping(Bool)->Void)
}

protocol createAccountInteractorOutputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> PRESENTER
     */
}

protocol createAccountInteractorInputProtocol: class
{
    var presenter: createAccountInteractorOutputProtocol? { get set }
    /**
     * Add here your methods for communication PRESENTER -> INTERACTOR
     */
    func validarUsuario(usuario: String, completion: @escaping(Bool)->Void)
}
