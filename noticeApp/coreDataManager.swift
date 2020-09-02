//
//  coreDataManager.swift
//  noticeApp
//
//  Created by Miguel Eduardo  Valdez Tellez  on 25/08/20.
//  Copyright © 2020 Miguel Eduardo  Valdez Tellez . All rights reserved.
//

import Foundation
import CoreData

class coreDataManager{
    static let shared = coreDataManager()
    private let container : NSPersistentContainer!
    init()
    {
        container = NSPersistentContainer(name: "Model")
        setupDatabase()
    }
    
    private func setupDatabase() {
        container.loadPersistentStores { (desc, error) in
            if let error = error {
                print("Error loading store \(desc) -\(error)")
                return
            }
            print("conexion exitosa")
        }
    }
    
    func createPubli(usuario: String, like: Int16,image: Data!,fecha: String,contenido:String!,publiImage: Data!, completion: @escaping() -> Void)
    {
        let context = container.viewContext
        let publi = Publicaciones(context: context)
        publi.usuario = usuario
        publi.like = like
        publi.imagen = image
        publi.fecha = fecha
        publi.contenido = contenido
        publi.publiImage = publiImage
        //save
        do{
            try context.save()
            print("Publicacion \(usuario) guardado")
            completion()
        }catch{
            print("Error guardando Usuario \(usuario)")
        }
    }
    
    func createUsers(usuario: String, contraseña: String,image: Data, completion: @escaping() -> Void)
    {
        let context = container.viewContext
        let user = Users(context: context)
        user.user = usuario
        user.password = contraseña
        user.image = image
        //save
        do{
            try context.save()
            print("Usuario \(usuario) guardado")
            completion()
        }catch{
            print("Error guardando Usuario \(usuario)")
        }
    }

    func login(usuario: String, contraseña: String) -> Bool
    {
        var flag = false
        let fetchRequest: NSFetchRequest<Users> = Users.fetchRequest()
        do{
            let result = try container.viewContext.fetch(fetchRequest)
            result.forEach { (users) in
                if usuario == users.user && contraseña==users.password
                {
                    print("coinciden")
                    flag = true
                }
            }
        }catch{
            print("No existe usuario")
        }
        return flag
    }
    
    func usuarioExiste(usuario: String, completion: @escaping(Bool)->Void){
        var flag = false
        let fetchRequest: NSFetchRequest<Users> = Users.fetchRequest()
        do{
            let result = try container.viewContext.fetch(fetchRequest)
            result.forEach { (users) in
                if usuario == users.user
                {
                    print("Usuario Existe")
                    flag = true
                }
            }
        }catch{
            print("No existe usuario")
        }
        completion(flag)
    }
    
    
    func fetchPubli() -> [Publicaciones] {
        let fetchRequest : NSFetchRequest<Publicaciones> = Publicaciones.fetchRequest()
        do {
            let result = try container.viewContext.fetch(fetchRequest)
            return result
        }
        catch
        {
            print("El error obteniendo tarea(s) \(error)")
        }
        return []
    }
    
    func fetchUsers() -> [Users] {
        let fetchRequest : NSFetchRequest<Users> = Users.fetchRequest()
        do {
            let result = try container.viewContext.fetch(fetchRequest)
            return result
        }
        catch
        {
            print("El error obteniendo tarea(s) \(error)")
        }
        return []
    }

    func getImage(usuario: String) -> Data
    {
        var imagen: Data?
        let fetchRequest : NSFetchRequest<Users> = Users.fetchRequest()
        do {
            let result = try container.viewContext.fetch(fetchRequest)
            result.forEach { (users) in
                if usuario == users.user
                {
                    imagen = users.image
                }
            }
        }
        catch
        {
            print("El error obteniendo imagen(s) \(error)")
        }
        return imagen!
    }
    
    
}




