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
    private let manager = coreDataManager()
    var presenter: loginPresenterProtocol?
    let publicacionesB = publicacionesViewController()
    @IBOutlet weak var btnCreateView: UIButton!
    @IBOutlet weak var btnLoginView: UIButton!
    @IBOutlet weak var usuarioTextField: UITextField!
        {
        didSet{
            usuarioTextField.tintColor = UIColor.lightGray
            usuarioTextField.setIcon(UIImage(imageLiteralResourceName: "iconUser"))
        }
    }
    @IBOutlet weak var passwordTextField: UITextField!
        {
        didSet{
            passwordTextField.tintColor = UIColor.lightGray
            passwordTextField.setIcon(UIImage(imageLiteralResourceName: "pass"))
        }
    }
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
        btnLoginView.layer.cornerRadius = 15
        btnLoginView.layer.borderWidth = 1
        
        btnCreateView.layer.cornerRadius = 15
        btnCreateView.layer.borderWidth = 1
        
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

extension UITextField{
    func setIco(_ image: UIImage){
        let iconView = UIImageView(frame:
            CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame:
            CGRect(x: 20, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
}
