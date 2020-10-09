//
//  AssetsService.swift
//  Bank Mestika
//
//  Created by Prima Jatnika on 08/10/20.
//

import Combine
import Alamofire

class AssetsService: APIHandler {
    
    @Published var assetsResponse: AssetsResponse?
    @Published var isLoading = false
    
    func getPhoneUUID() {
        isLoading = true
        
        let url = "https://raw.githubusercontent.com/primajatnika271995/dummy-json/main/db.json"
        
        AF.request(url, method: .get).responseDecodable { [weak self] (response: DataResponse<AssetsResponse, AFError>) in
            guard let weakSelf = self else {  return  }
            
            guard let response = weakSelf.handleResponse(response) as? AssetsResponse else {
                weakSelf.isLoading = false
                return
            }
            
            weakSelf.isLoading = false
            weakSelf.assetsResponse = response
        }
    }
}
