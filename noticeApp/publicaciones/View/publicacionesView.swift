//
//  publicacionesView.swift
//  noticeApp
//
//  Created by Miguel Eduardo Valdez Tellez on 08/25/2020.
//  Copyright © 2020 Linko. All rights reserved.
//

import Foundation
import UIKit

class publicacionesViewController: UIViewController, publicacionesViewProtocol, UITableViewDataSource, UITableViewDelegate{
    var user: String!
    var presenter: publicacionesPresenterProtocol?
    private var publica: [Publicaciones]  = []
    @IBOutlet weak var publicaTable: UITableView!
    @IBAction func btnCrearPublicaciones(_ sender: Any) {
        presenter?.newPubli(usuario: user)
    }
    @IBOutlet weak var perfilImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        publicaTable.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        publicaTable.delegate = self
        publicaTable.dataSource = self
        if let imagen = presenter?.getImage(usuario: user)
        {
            perfilImage.image = UIImage(data: imagen)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.getPubli()
    }
    
    
    func returnData(publicaciones: Array<Publicaciones>) {
        publica=publicaciones
        publicaTable.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return publica.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell",
                                                 for: indexPath)
        if let newCell = cell as? TableViewCell {
            DispatchQueue.main.async {
                let publi = self.publica[indexPath.row]
                let usuario = publi.usuario
                let fecha = publi.fecha
                let imagen = publi.imagen
                let uiImage = UIImage(data: imagen!)
                let contenido = publi.contenido
                var uiImage2: UIImage?
                if let conteIma = publi.publiImage
                {
                    uiImage2 = UIImage(data: conteIma)
                }
                newCell.setupCell(user: usuario!, fecha: fecha!, imagen: uiImage, contenido: contenido, publiImage: uiImage2)
                
            }
        }
        return cell
    }
}



