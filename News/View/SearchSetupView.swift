//
//  SearchSetupView.swift
//  News
//
//  Created by Thomas Schatton on 07.07.22.
//

import SwiftUI

struct SearchSetupView: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var settings: SearchSettings
    
    private var lowerLimit: Date {
        // MARK: testing the API with from and to parameters shows that the api is not working correctly
        // basic plan of newsapi only allows seraching for articles not older than a month
        Calendar.current.date(byAdding: .day, value: -30, to: Date()) ?? .now
    }
    
    private var upperLimit: Date {
        .now
    }
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("What are you looking for?", text: $settings.searchText)
                } header: {
                    Text("Currently searching for")
                }

                
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
                    Toggle(settings.periodToggleOn ? "Disable" : "Enable", isOn: $settings.periodToggleOn.animation())
                    if settings.periodToggleOn{
                        
                        VStack(alignment: .leading) {
                            DatePicker("From", selection: $settings.from, in: lowerLimit...upperLimit, displayedComponents: .date)
                                .datePickerStyle(.compact)
                            
                            DatePicker("to", selection: $settings.to, in: settings.from...upperLimit, displayedComponents: .date)
                                .datePickerStyle(.compact)
                        }
                    }
                } header: {
                    Text("Period")
                }
                
                Section {
                    Picker("Sorting by", selection: $settings.sortBy) {
                        ForEach(sortings, id:\.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Sorting")
                }
            }
            .navigationTitle("Search Settings")
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

struct SearchSetupView_Previews: PreviewProvider {
    static var previews: some View {
        SearchSetupView(settings: SearchSettings())
    }
}
