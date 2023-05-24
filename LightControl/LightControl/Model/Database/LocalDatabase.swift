//
//  LocalDatabase.swift
//  LightControl
//
//  Created by imac-2626 on 2023/5/23.
//

import Foundation
import RealmSwift

class LocalDatabase: NSObject {
    
    static let shared = LocalDatabase()
    
    func add(model: Light, finish: @escaping(Result<Bool, Error>) -> Void) {
        do {
            let realm = try Realm()
            let light = Light(name: model.name,
                              lightCode: model.lightCode,
                              isCustom: model.isCustom)
            
            try realm.write {
                realm.add(light)
            }
            
            finish(.success(true))
        } catch {
            print("Realm Add Failed，Error：\(error.localizedDescription)")
            
            finish(.failure(error))
        }
    }
    
    func fetch() {

    }
    
    func update() {
        
    }
    
    func delete() {
        
    }
}
