//
//  SettingsView.swift
//  SwiftUIByExample
//
//  Created by junemp on 2022/04/30.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    @ObservedObject var logs: LogStore
    @State private var exportShown = false
    
    var body: some View {
        Form {
            Section(header: Text("debug")) {
                Button("exportLogs") {
                    logs.export()
                    exportShown = true
                }
                .sheet(isPresented: $exportShown) {
                    ShareView(items: [logs.entries.joined(separator: "\n")])
                }
            }
        }
    }
}

struct ShareView: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIActivityViewController
    
    let items: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: items, applicationActivities: nil)
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            var logStore: LogStore = LogStore()
            SettingsView(logs: logStore)               .previewInterfaceOrientation(.portraitUpsideDown)
        } else {
            // Fallback on earlier versions
        }
    }
}
