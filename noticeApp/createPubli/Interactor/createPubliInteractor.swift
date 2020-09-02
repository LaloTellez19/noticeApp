//
//  createPubliInteractor.swift
//  noticeApp
//
//  Created by Miguel Eduardo Valdez Tellez on 08/27/2020.
//  Copyright © 2020 Linko. All rights reserved.
//

import Foundation

class createPubliInteractor: createPubliInteractorInputProtocol {
    func getImagen(usuario: String) -> Data {
        manager.getImage(usuario: usuario)
    }
    
    func cretePubli(usuario: String, like: Int16, image: Data, fecha: String, contenido: String, publiImage: Data) {
        manager.createPubli(usuario: usuario, like: like, image: image, fecha: fecha, contenido: contenido, publiImage: publiImage){}
    }
    

    weak var presenter: createPubliInteractorOutputProtocol?
    private var manager = coreDataManager()
    init() {}
}
