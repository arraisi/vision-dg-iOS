//
//  AssetsService.swift
//  Bank Mestika
//
//  Created by Prima Jatnika on 08/10/20.
//

import Foundation
import SwiftyJSON

class AssetsService {
    
    public func getAssetsAPI(onSuccess successCallback: ((_ response: [AssetsResponse]) -> Void)?,
                             onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
        
        let url = "https://my-json-server.typicode.com/primajatnika271995/dummy-json/assets-landing"
        
        APICallManager.shared.createRequest(url, method: .get, headers: nil, parameters: nil) { (responseObject: JSON) in
            var data = [AssetsResponse]()
            
            if let assetsList = responseObject.arrayObject as? [[String: Any]] {
                data = AssetsResponse.getModels(assetsList)
            }
            successCallback?(data)
            
        } onFailure: { (errorMessage: String) in
            failureCallback?(errorMessage)
        }

    }
}
