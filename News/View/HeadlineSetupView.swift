//
//  CriteriaSettingsView.swift
//  News
//
//  Created by Thomas Schatton on 06.07.22.
//

import SwiftUI

struct HeadlineSetupView: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var settings: HeadlineSettings
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Picker("Language", selection: $settings.language) {
                        ForEach(languages, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Language")
                }
                
                Section {
                    Picker("Category", selection: $settings.category) {
                        ForEach(categories, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.wheel)
                } header: {
                    Text("Category")
                }
            }
            .navigationTitle("Headlines Settings")
            .listStyle(.grouped)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Reset") {
                        settings.resetSettings()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct CriteriaSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        HeadlineSetupView(settings: HeadlineSettings())
    }
}
