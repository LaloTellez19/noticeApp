//
//  publicacionesPresenter.swift
//  noticeApp
//
//  Created by Miguel Eduardo Valdez Tellez on 08/25/2020.
//  Copyright © 2020 Linko. All rights reserved.
//

import Foundation

class publicacionesPresenter: publicacionesPresenterProtocol, publicacionesInteractorOutputProtocol {
    func returnData(publicaciones: Array<Publicaciones>) {
        view?.returnData(publicaciones: publicaciones)
    }
    
    func getPubli() {
        interactor?.getPubli()
    }
    
    func getImage(usuario: String) -> Data {
        (interactor?.getImage(usuario: usuario))!
    }
    
    func newPubli(usuario: String) {
        wireFrame?.newPubli(controlador: view!, usuario: usuario)
    }
    
    weak var view: publicacionesViewProtocol?
    var interactor: publicacionesInteractorInputProtocol?
    var wireFrame: publicacionesWireFrameProtocol?
    
    init() {}
}
