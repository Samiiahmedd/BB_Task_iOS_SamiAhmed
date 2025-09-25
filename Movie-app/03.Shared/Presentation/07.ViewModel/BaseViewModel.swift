//
//  BaseViewModel.swift
//  GoApp
//
//  Created by Abdalazem Saleh on 16/04/2025.
//

import Foundation
import Combine
import NetworkLayer

class BaseViewModel: ObservableObject {
    
    // MARK: - Propertys
    var subscription = Set<AnyCancellable>()
    
    // MARK: - Deinit
    init() {
        configureInputObservers()
        configureOutputObservers()
    }
    
    deinit {
        subscription.removeAll()
    }
    
    // MARK: - Helper Functions
    func handelError(_ error: Error, errorMessage: (String) -> Void) {
        if let error = error as? NetworkError {
            errorMessage(error.description)
        } else {
            errorMessage(error.localizedDescription)
        }
    }
    
    func fetchWithRetry<T>(_ label: String, _ operation: @escaping () async throws -> T) async {
        do {
            _ = try await operation()
        } catch {
            print("\(label) first attempt failed. Retrying...")
            do {
                _ = try await operation()
            } catch {
                print("\(label) second attempt failed: \(error.localizedDescription)")
            }
        }
    }
}

extension BaseViewModel {
    @objc func configureInputObservers() {
    }
    
    @objc func configureOutputObservers() {
        
    }
}
