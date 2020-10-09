//
//  AssetsViewModel.swift
//  Bank Mestika
//
//  Created by Prima Jatnika on 09/10/20.
//

import Foundation
import Combine

class AssetsViewModel: ObservableObject {
    let willChange = PassthroughSubject<Void, Never>()
    
    private var assetsService: AssetsService = AssetsService()
    
    @Published var isLoading: Bool = true
    
    var assetsList: [AssetsResponse] = [AssetsResponse]() {
        willSet {
            willChange.send()
        }
    }
    
    func getAssets() {
        assetsService.getAssetsAPI { (response) in
            self.assetsList = response
            print("Response \(response)")
            self.isLoading = false
        } onFailure: { (message) in
            print("message \(message)")
        }

    }
}
