//
//  publicacionesWireFrame.swift
//  noticeApp
//
//  Created by Miguel Eduardo Valdez Tellez on 08/25/2020.
//  Copyright © 2020 Linko. All rights reserved.
//

import Foundation
import UIKit

class publicacionesWireFrame: publicacionesWireFrameProtocol {
    func newPubli(controlador: AnyObject, usuario: String) {
        createPubliWireFrame.presentcreatePubliModule(fromView: controlador, usuario: usuario)
    }

    static func presentpublicacionesModule(fromView vc:AnyObject, usuario: String) {
        
        // Generating module components
        let storyboard = UIStoryboard(name: "Publi", bundle: Bundle.main)
        let view: publicacionesViewProtocol = storyboard.instantiateViewController(withIdentifier: "cambio") as! publicacionesViewProtocol
        let presenter: publicacionesPresenterProtocol & publicacionesInteractorOutputProtocol = publicacionesPresenter()
        let interactor: publicacionesInteractorInputProtocol = publicacionesInteractor()
        let wireFrame: publicacionesWireFrameProtocol = publicacionesWireFrame()
        (view as? publicacionesViewController)?.user = usuario
        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        if let vc = vc as? UIViewController{
            vc.navigationController?.pushViewController(view as! UIViewController, animated: true)
        }
        
    }
}
