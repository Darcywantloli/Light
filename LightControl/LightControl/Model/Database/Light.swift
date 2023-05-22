//
//  Light.swift
//  LightControl
//
//  Created by imac-2626 on 2023/5/22.
//

import RealmSwift

class Light: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name: String = ""
    @Persisted var lightCode: String = ""
    @Persisted var isCustom: Bool = false
    
    convenience init(name: String,
                     lightCode: String,
                     isCustom: Bool) {
        self.init()
        self.name = name
        self.lightCode = lightCode
        self.isCustom = isCustom
    }
}
