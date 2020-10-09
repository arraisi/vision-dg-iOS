//
//  AssetsResponse.swift
//  Bank Mestika
//
//  Created by Prima Jatnika on 08/10/20.
//

class AssetsResponse: Decodable {

    var id: Int?
    var imageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case imageUrl
    }
    
    init() {}
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try? container.decode(Int.self, forKey: .id)
        imageUrl = try? container.decode(String.self, forKey: .imageUrl)
    }
}
