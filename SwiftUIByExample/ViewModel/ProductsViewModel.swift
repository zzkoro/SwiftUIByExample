//
//  ProductsViewModel.swift
//  SwiftUIByExample
//
//  Created by junemp on 2022/04/30.
//

import Foundation
import os

@MainActor final class ProductsViewModel: ObservableObject {
    private static let logger = Logger(subsystem: Bundle.main.bundleIdentifier!, category: String(describing: ProductsViewModel.self))
    
    @Published private(set) var products: [Product] = []
    
    private let service: ProductService
    
    init(service: ProductService) {
        self.service = service
    }
    
    func fetch() async {
        do {
            Self.logger.trace("Startg product list fetching")
            products = try await service.fetch()
            Self.logger.notice("Product lsit fetching is finished")
        } catch {
            Self.logger.warning("\(error.localizedDescription, privacy: .public)")
        }
    }
}


