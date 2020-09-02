//
//  publicacionesProtocols.swift
//  noticeApp
//
//  Created by Miguel Eduardo Valdez Tellez on 08/25/2020.
//  Copyright © 2020 Linko. All rights reserved.
//

import Foundation

protocol publicacionesViewProtocol: class {
    var presenter: publicacionesPresenterProtocol? { get set }
    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
    func returnData(publicaciones: Array<Publicaciones>)
}

protocol publicacionesWireFrameProtocol: class {
    static func presentpublicacionesModule(fromView vc: AnyObject, usuario: String)
    /**
     * Add here your methods for communication PRESENTER -> WIREFRAME
     */
    func newPubli(controlador: AnyObject, usuario: String)
}

protocol publicacionesPresenterProtocol: class {
    var view: publicacionesViewProtocol? { get set }
    var interactor: publicacionesInteractorInputProtocol? { get set }
    var wireFrame: publicacionesWireFrameProtocol? { get set }
    /**
     * Add here your methods for communication VIEW -> PRESENTER
     */
    func newPubli(usuario: String)
    func getImage(usuario: String)->Data
    func getPubli()
}

protocol publicacionesInteractorOutputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> PRESENTER
     */
    func returnData(publicaciones: Array<Publicaciones>)
}

protocol publicacionesInteractorInputProtocol: class
{
    var presenter: publicacionesInteractorOutputProtocol? { get set }
    /**
     * Add here your methods for communication PRESENTER -> INTERACTOR
     */
    func getImage(usuario: String)->Data
    func getPubli()
}
