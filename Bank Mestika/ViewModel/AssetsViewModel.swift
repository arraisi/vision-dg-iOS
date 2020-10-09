//
//  AssetsViewModel.swift
//  Bank Mestika
//
//  Created by Prima Jatnika on 08/10/20.
//

import SwiftUI
import Combine

class AssetsViewModel: ObservableObject, Identifiable {
    @Published var isLoading = false
        
    @Published var shouldNavigate = false
        
    private var disposables: Set<AnyCancellable> = []
    
    var assetsService = AssetsService()
    
    @Published var imageUrl = ""
    
    private var isLoadingPublisher: AnyPublisher<Bool, Never> {
        assetsService.$isLoading
            .receive(on: RunLoop.main)
            .map { $0 }
            .eraseToAnyPublisher()
    }
    
    private var isAuthenticatedPublisher: AnyPublisher<String, Never> {
        assetsService.$assetsResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {
                    return ""
                }
                
                return response.imageUrl ?? ""
        }
        .eraseToAnyPublisher()
    }
    
    init() {
        isLoadingPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.isLoading, on: self)
            .store(in: &disposables)
        
        isAuthenticatedPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.imageUrl, on: self)
            .store(in: &disposables)
    }
    
    func getPhoneUUID() {
        assetsService.getPhoneUUID()
    }
}
