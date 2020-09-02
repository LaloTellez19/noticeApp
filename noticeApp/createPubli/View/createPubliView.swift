//
//  createPubliView.swift
//  noticeApp
//
//  Created by Miguel Eduardo Valdez Tellez on 08/27/2020.
//  Copyright © 2020 Linko. All rights reserved.
//

import Foundation
import UIKit

class createPubliViewController: UIViewController, createPubliViewProtocol, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    @IBOutlet weak var textPubli: UITextView!
    var user: String!
    var presenter: createPubliPresenterProtocol?
    @IBOutlet weak var previewImage: UIImageView!
    @IBAction func btnImagen(_ sender: Any) {
        chooseImage()
    }
    
    @IBAction func btnCancel(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnPublicar(_ sender: Any) {
        let date = Date()
        let dateFormetter = DateFormatter()
        dateFormetter.dateStyle = .medium
        let dateiniAdd = dateFormetter.string(from: date)
        if let imagen = previewImage.image?.pngData(),
            let perfil = presenter?.getImagen(usuario: user),
            let contenido = textPubli.text{
            presenter?.cretePubli(usuario: user, like: 0, image: perfil, fecha: dateiniAdd, contenido: contenido, publiImage: imagen)
            navigationController?.popViewController(animated: true)
        }else{
            /*presenter?.cretePubli(usuario: "Lalo", like: 0, image: (previewImage.image?.pngData())!, fecha: dateiniAdd, contenido: textPubli.text, publiImage: (previewImage.image?.pngData())!)
            navigationController?.popViewController(animated: true)*/
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        initizalaHideKeyboad()
        textPubli.layer.borderWidth = 1
        textPubli.layer.borderColor = UIColor.black.cgColor
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
        previewImage.image = image
        picker.dismiss(animated: true,completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true,completion: nil)
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
