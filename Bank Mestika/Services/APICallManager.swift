//
//  APICallManager.swift
//  Bank Mestika
//
//  Created by Prima Jatnika on 09/10/20.
//

import Foundation
import Alamofire
import SwiftyJSON

class APICallManager {
    static let shared = APICallManager()

    func createRequest(
        _ url: String,
        method: HTTPMethod,
        headers: [String: String]?,
        parameters: AnyObject?,
        onSuccess successCallback: ((JSON) -> Void)?,
        onFailure failureCallback: ((String) -> Void)?
    ) {
        AF.request(url, method: method).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                successCallback?(json)
            case .failure(let error):
                if let callback = failureCallback {
                    callback(error.localizedDescription)
                }
            }
        }
    }
    
}
