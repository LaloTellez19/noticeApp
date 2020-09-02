//
//  createPubliWireFrame.swift
//  noticeApp
//
//  Created by Miguel Eduardo Valdez Tellez on 08/27/2020.
//  Copyright © 2020 Linko. All rights reserved.
//

import Foundation
import UIKit

class createPubliWireFrame: createPubliWireFrameProtocol {

    
    func publicando(controlador: AnyObject) {
    }
    
    func cancelarNew(controlador: AnyObject) {
    }
    

    static func presentcreatePubliModule(fromView vc:AnyObject, usuario: String) {

        // Generating module components
        let storyboard = UIStoryboard(name: "nuevaPubli", bundle: Bundle.main)
        let view: createPubliViewProtocol = storyboard.instantiateViewController(withIdentifier: "new") as! createPubliViewProtocol
        let presenter: createPubliPresenterProtocol & createPubliInteractorOutputProtocol = createPubliPresenter()
        let interactor: createPubliInteractorInputProtocol = createPubliInteractor()
        let wireFrame: createPubliWireFrameProtocol = createPubliWireFrame()
        (view as? createPubliViewController)?.user = usuario
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
