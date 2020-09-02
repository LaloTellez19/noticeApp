//
//  createPubliPresenter.swift
//  noticeApp
//
//  Created by Miguel Eduardo Valdez Tellez on 08/27/2020.
//  Copyright © 2020 Linko. All rights reserved.
//

import Foundation

class createPubliPresenter: createPubliPresenterProtocol, createPubliInteractorOutputProtocol {
    
    weak var view: createPubliViewProtocol?
    var interactor: createPubliInteractorInputProtocol?
    var wireFrame: createPubliWireFrameProtocol?
    
    init() {}
    func getImagen(usuario: String) -> Data {
        (interactor?.getImagen(usuario: usuario))!
    }
    
    func cretePubli(usuario: String, like: Int16, image: Data, fecha: String, contenido: String!, publiImage: Data!) {
        interactor?.cretePubli(usuario: usuario, like: like, image: image, fecha: fecha, contenido: contenido, publiImage: publiImage)
    }
}
