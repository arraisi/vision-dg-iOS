//
//  APIHandler.swift
//  Bank Mestika
//
//  Created by Prima Jatnika on 08/10/20.
//

import Combine
import Alamofire

class APIHandler {
        
    var statusCode = Int.zero
    
    func handleResponse<T: Decodable>(_ response: DataResponse<T, AFError>) -> Any? {
        switch response.result {
        case .success:
            return response.value
        case .failure:
            return nil
        }
    }
}
