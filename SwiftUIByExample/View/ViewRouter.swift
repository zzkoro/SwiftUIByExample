//
//  ViewRouter.swift
//  SwiftUIByExample
//
//  Created by junemp on 2022/05/01.
//

import Foundation
import SwiftUI

enum Page {
    case page1
    case page2
}

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .page1
}
