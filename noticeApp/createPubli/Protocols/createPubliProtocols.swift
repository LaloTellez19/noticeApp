//
//  createPubliProtocols.swift
//  noticeApp
//
//  Created by Miguel Eduardo Valdez Tellez on 08/27/2020.
//  Copyright © 2020 Linko. All rights reserved.
//

import Foundation

protocol createPubliViewProtocol: class {
    var presenter: createPubliPresenterProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> VIEW
    */
}

protocol createPubliWireFrameProtocol: class {
    static func presentcreatePubliModule(fromView vc: AnyObject, usuario: String)
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
}

protocol createPubliPresenterProtocol: class {
    var view: createPubliViewProtocol? { get set }
    var interactor: createPubliInteractorInputProtocol? { get set }
    var wireFrame: createPubliWireFrameProtocol? { get set }
    /**
    * Add here your methods for communication VIEW -> PRESENTER
    */
    func cretePubli(usuario: String, like: Int16,image: Data,fecha: String,contenido:String!,publiImage: Data!)
    func getImagen(usuario: String)->Data

}

protocol createPubliInteractorOutputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> PRESENTER
    */
}

protocol createPubliInteractorInputProtocol: class
{
    var presenter: createPubliInteractorOutputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
    func cretePubli(usuario: String, like: Int16,image: Data,fecha: String,contenido:String!,publiImage: Data!)
    func getImagen(usuario: String)->Data
    
}
