//
//  ViewController.swift
//  noticeApp
//
//  Created by Miguel Eduardo  Valdez Tellez  on 25/08/20.
//  Copyright © 2020 Miguel Eduardo  Valdez Tellez . All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, loginViewProtocol{
    var presenter: loginPresenterProtocol?
    private let manager = coreDataManager()
    let publicacionesB = publicacionesViewController()
    
    @IBOutlet weak var usuarioTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBAction func btnLogin(_ sender: Any) {
        if let usertxt = usuarioTextField.text, usertxt.isEmpty,
            let passtxt = passwordTextField.text, passtxt.isEmpty{
            camposVacios()
        }else{
            if let usuario = usuarioTextField.text,
                let contra = passwordTextField.text{
                if let flag = presenter?.login(usuario: usuario, contraseña: contra){
                    if flag == true{
                        presenter?.cambioPubli(usuario: usuario)
                    }else{
                        usuarioEquivocado()
                    }
                }
            }
        }
    }
    
    @IBAction func btnCreate(_ sender: Any) {
        presenter?.cambioCreateAccount()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        inicializarViper()
        initizalaHideKeyboad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        usuarioTextField.text = ""
        passwordTextField.text = ""
    }
    func inicializarViper()
    {
        let view: loginViewProtocol = self
        let presenterTempo: loginPresenterProtocol & loginInteractorOutputProtocol = loginPresenter()
        let interactor: loginInteractorInputProtocol = loginInteractor()
        let wireFrame: loginWireFrame = loginWireFrame()
        // Connecting
        view.presenter = presenterTempo
        presenterTempo.view = view
        presenterTempo.wireFrame = wireFrame
        presenterTempo.interactor = interactor
        interactor.presenter = presenterTempo
        presenter = presenterTempo
    }
    
    func camposVacios()
    {
        let alert = UIAlertController(title: "Campos vacios", message: "Uno o ambos campos vacios", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Intenta de nuevo", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    func usuarioEquivocado()
    {
        let alert = UIAlertController(title: "Error", message: "Usuario y/o contraseña incorrecta ", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Intenta de nuevo", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    func bienvenido()
    {
        let alert = UIAlertController(title: "Hola!", message: "BIENVENIDO", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Vamos!", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func initizalaHideKeyboad()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissMyKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissMyKeyboard(){
        view.endEditing(true)
    }
}

