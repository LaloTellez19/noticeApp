//
//  createAccountWireFrame.swift
//  noticeApp
//
//  Created by Miguel Eduardo Valdez Tellez on 08/25/2020.
//  Copyright © 2020 Linko. All rights reserved.
//

import Foundation
import UIKit

class createAccountWireFrame: createAccountWireFrameProtocol {
    func cancelar(controlador: AnyObject) {
        loginWireFrame.presentloginModule(fromView: controlador)
    }
    
    func cambiarLogin(controlador: AnyObject) {
        loginWireFrame.presentloginModule(fromView: controlador)
    }
    
    static func presentcreateAccountModule(fromView vc:AnyObject) {
        
        // Generating module components
        let storyboard = UIStoryboard(name: "createAccount", bundle: Bundle.main)
        let view: createAccountViewProtocol = storyboard.instantiateViewController(withIdentifier: "crear_usuario") as! createAccountViewProtocol
        let presenter: createAccountPresenterProtocol & createAccountInteractorOutputProtocol = createAccountPresenter()
        let interactor: createAccountInteractorInputProtocol = createAccountInteractor()
        let wireFrame: createAccountWireFrameProtocol = createAccountWireFrame()
        
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
