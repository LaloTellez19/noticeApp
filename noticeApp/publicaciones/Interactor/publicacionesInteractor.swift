//
//  publicacionesInteractor.swift
//  noticeApp
//
//  Created by Miguel Eduardo Valdez Tellez on 08/25/2020.
//  Copyright © 2020 Linko. All rights reserved.
//

import Foundation

class publicacionesInteractor: publicacionesInteractorInputProtocol {
    func getPubli() {
        var publicaciones: [Publicaciones] = []
        publicaciones = manager.fetchPubli()
        presenter?.returnData(publicaciones: publicaciones)
    }
    
    func getImage(usuario: String) -> Data {
        manager.getImage(usuario: usuario)
    }
    

    weak var presenter: publicacionesInteractorOutputProtocol?
    private var manager = coreDataManager()
    init() {}
}
