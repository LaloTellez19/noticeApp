//
//  TableViewCell.swift
//  noticeApp
//
//  Created by Miguel Eduardo  Valdez Tellez  on 26/08/20.
//  Copyright © 2020 Miguel Eduardo  Valdez Tellez . All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var btnLikeView: UIButton!
    @IBAction func btnLike(_ sender: Any) {
        
    }
    @IBOutlet weak var fechaTextField: UILabel!
    @IBOutlet weak var imagePubli: UIImageView!
    @IBOutlet weak var userTextField: UILabel!
    @IBOutlet weak var labelPubli: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        if let imagen = userImage{
            imagen.layer.cornerRadius = imagen.bounds.size.width / 2
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setupCell(user: String, fecha: String, imagen: UIImage!, contenido: String!, publiImage: UIImage!)
    {
        userTextField.text = user
        fechaTextField.text = fecha
        userImage.image = imagen
        if let contenido = contenido{
            labelPubli.text = contenido
        }else{
            labelPubli.isHidden = true
        }
        
        if let imagen = publiImage{
            imagePubli?.image = imagen
        }else{
            imagePubli.isHidden = true
        }
    }
    
}
