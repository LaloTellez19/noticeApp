//
//  loginProtocols.swift
//  noticeApp
//
//  Created by Miguel Eduardo Valdez Tellez on 08/25/2020.
//  Copyright © 2020 Linko. All rights reserved.
//

import Foundation

protocol loginViewProtocol: class {
    var presenter: loginPresenterProtocol? { get set }
    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
}

protocol loginWireFrameProtocol: class {
    static func presentloginModule(fromView vc: AnyObject)
    /**
     * Add here your methods for communication PRESENTER -> WIREFRAME
     */
    func cambioCreateAccount(contralador: AnyObject)
    func cambioPubli(controlador: AnyObject, usuario: String)
}

protocol loginPresenterProtocol: class {
    var view: loginViewProtocol? { get set }
    var interactor: loginInteractorInputProtocol? { get set }
    var wireFrame: loginWireFrameProtocol? { get set }
    /**
     * Add here your methods for communication VIEW -> PRESENTER
     */
    func cambioCreateAccount()
    func cambioPubli(usuario: String)
    func login(usuario: String, contraseña: String)->Bool
    
}

protocol loginInteractorOutputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> PRESENTER
     */
}

protocol loginInteractorInputProtocol: class
{
    var presenter: loginInteractorOutputProtocol? { get set }
    /**
     * Add here your methods for communication PRESENTER -> INTERACTOR
     */
    func login(usuario: String, contraseña: String)->Bool
}
