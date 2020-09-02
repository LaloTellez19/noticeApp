//
//  createAccountView.swift
//  noticeApp
//
//  Created by Miguel Eduardo Valdez Tellez on 08/25/2020.
//  Copyright © 2020 Linko. All rights reserved.
//

import Foundation
import UIKit

class createAccountViewController: UIViewController, createAccountViewProtocol, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var presenter: createAccountPresenterProtocol?
    let manager = coreDataManager()
    @IBOutlet weak var btnCreateView: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var btnAddView: UIButton!
    @IBOutlet weak var passTextField: UITextField!
        {
        didSet{
            passTextField.tintColor = UIColor.lightGray
            passTextField.setIcon(UIImage(imageLiteralResourceName: "pass"))
        }
    }
    @IBOutlet weak var userTextField: UITextField!{
        didSet{
            userTextField.tintColor = UIColor.lightGray
            userTextField.setIcon(UIImage(imageLiteralResourceName: "iconUser"))
        }
    }

    @IBAction func btnCancelar(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnCreate(_ sender: Any) {
        if let usertxt = userTextField.text, usertxt.isEmpty,
            let passtxt = passTextField.text, passtxt.isEmpty{
            camposVacios()
        }else{
            let usuario = userTextField.text ?? ""
            let contra = passTextField.text ?? ""
            let imagen = imageView.image?.pngData()
            presenter?.validarUsuario(usuario: usuario, completion: { (flag) in
                if flag == false
                {
                    self.manager.createUsers(usuario: usuario, contraseña: contra, image: imagen!){}
                    self.navigationController?.popViewController(animated: true)
                    self.usuarioCreado()
                    
                }else{
                    self.usuarioExiste()
                }
            })
        }
    }

    @IBAction func addimage(_ sender: Any) {
        DispatchQueue.main.async {
            self.chooseImage()
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initizalaHideKeyboad()
        btnCreateView.layer.cornerRadius = 15
        btnCreateView.layer.borderWidth = 1
        btnAddView.layer.cornerRadius = 15
        btnAddView.layer.borderWidth = 1
    }

    func chooseImage()
    {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        let actionSheet = UIAlertController(title: "Galeria", message: "Elige una imagen", preferredStyle:.actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camara", style: .default, handler: { (action: UIAlertAction) in
            
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
            }
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Galeria", style: .default, handler: { (action: UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        self.present(actionSheet,animated: true, completion: nil)
    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imageView.image = image
        picker.dismiss(animated: true,completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true,completion: nil)
    }
    
    
    func camposVacios()
    {
        let alert = UIAlertController(title: "Campos vacios", message: "Uno o ambos campos vacios", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Intenta de nuevo", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    func usuarioExiste()
    {
        let alert = UIAlertController(title: "Usuario Existente", message: "El nombre de usuario ya existe", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Probar otro", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    func usuarioCreado()
    {
        let alert = UIAlertController(title: "Usuario creado", message: "Usuario creado exitosamente", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Iniciar Sesion", style: .default, handler: nil))
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
    func setIcon(_ image: UIImage){
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
