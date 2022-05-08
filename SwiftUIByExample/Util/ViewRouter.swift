//
//  ViewRouter.swift
//  SwiftUIByExample
//
//  Created by junemp on 2022/05/01.
//

import Foundation
import SwiftUI

enum Page {
    case main
    case page2
    case page3
}

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .main
}
