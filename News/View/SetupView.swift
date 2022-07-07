//
//  CriteriaSettingsView.swift
//  News
//
//  Created by Thomas Schatton on 06.07.22.
//

import SwiftUI

struct SetupView: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var settings: UserSettings
    
    @State private var from: Date = .now
    @State private var to: Date = .now
    
    private let languages: Array<Language> = [ .de, .en, .es, .fr, .it, .nl ]
    private let countries: Array<Country> = [ .at, .ca, .fr, .de, .jp, .nl, .pl, .ue, .gb, .us]
    private let categories: Array<Category> = [ .business, .entertainment, .general, .health, .science, .sports, .technology]
    
    private var lowerLimit: Date {
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
                    Toggle(settings.categoryToggleOn ? "Disable" : "Enable", isOn: $settings.categoryToggleOn.animation())
                    if settings.categoryToggleOn {
                        Picker("Category", selection: $settings.category) {
                            ForEach(categories, id: \.self) {
                                Text($0.rawValue)
                            }
                        }
                        .pickerStyle(.wheel)
                    }
                    
                } header: {
                    Text("Category")
                }
                
                Section {
                    Toggle(settings.periodToggleOn ? "Disable" : "Enable", isOn: $settings.periodToggleOn.animation())
                    if settings.periodToggleOn{
                        HStack {
                            Spacer()
                            
                            VStack(alignment: .leading) {
                                Text("From")
                                    .font(.title2)
                                
                                DatePicker("From", selection: $from, in: lowerLimit...upperLimit, displayedComponents: .date)
                                    .datePickerStyle(.compact)
                                    .labelsHidden()
                            }
                            
                            
                            Spacer()
                            
                            VStack(alignment: .leading) {
                                Text("To")
                                    .font(.title2)
                                
                                DatePicker("to", selection: $to, in: from...upperLimit, displayedComponents: .date)
                                    .datePickerStyle(.compact)
                                    .labelsHidden()
                            }
                            
                            Spacer()
                        }
                    }
                } header: {
                    Text("Period")
                }
            }
            .navigationTitle("Settings")
            .listStyle(.grouped)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Reset") {
                        from = .now
                        to = .now
                        settings.resetSettings()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        if settings.periodToggleOn {
                            settings.from = from
                            settings.to = to
                        } else {
                            settings.from = nil
                            settings.to = nil
                        }
                        dismiss()
                    }
                }
            }
        }
    }
}

struct CriteriaSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SetupView(settings: UserSettings())
    }
}
