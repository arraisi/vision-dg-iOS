//
//  AssetsResponse.swift
//  Bank Mestika
//
//  Created by Prima Jatnika on 08/10/20.
//

import Foundation

struct AssetsResponse: Hashable, Identifiable {
    
    var id: String = ""
    var imageUrl: String = ""
    
    init (json: [String: Any]) {
        if let id = json["id"] as? Int { self.id = "\(id)" }
        if let imageUrl = json["imageUrl"] { self.imageUrl = "\(imageUrl)" }
    }
    
    static func getModels(_ json: [[String: Any]]) -> [AssetsResponse] {
        return json.map { AssetsResponse(json: $0) }
    }
}
