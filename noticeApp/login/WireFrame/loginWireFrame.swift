//
//  loginWireFrame.swift
//  noticeApp
//
//  Created by Miguel Eduardo Valdez Tellez on 08/25/2020.
//  Copyright © 2020 Linko. All rights reserved.
//

import Foundation
import UIKit

class loginWireFrame: loginWireFrameProtocol {
    func cambioPubli(controlador: AnyObject, usuario: String) {
        publicacionesWireFrame.presentpublicacionesModule(fromView: controlador, usuario: usuario)
    }
    
    func cambioCreateAccount(contralador: AnyObject) {
        createAccountWireFrame.presentcreateAccountModule(fromView: contralador)
    }
    

    static func presentloginModule(fromView vc:AnyObject) {

        // Generating module components
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let view: loginViewProtocol = storyboard.instantiateViewController(withIdentifier: "Login") as! loginViewProtocol
        let presenter: loginPresenterProtocol & loginInteractorOutputProtocol = loginPresenter()
        let interactor: loginInteractorInputProtocol = loginInteractor()
        let wireFrame: loginWireFrameProtocol = loginWireFrame()

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
