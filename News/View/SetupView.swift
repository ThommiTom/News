//
//  CriteriaSettingsView.swift
//  News
//
//  Created by Thomas Schatton on 06.07.22.
//

import SwiftUI

struct SetupView: View {
    @State private var language: Language = .de
    @State private var country: Country = .de
    @State private var category: Category = .general
    @State private var from: Date = .now
    @State private var to: Date = Date.now
    
    private var lowerLimit: Date {
        Calendar.current.date(byAdding: .day, value: -30, to: Date()) ?? .now
    }
    private var upperLimit: Date {
        .now
    }
    
    
    private let languages: Array<Language> = [ .de, .en, .es, .fr, .it, .nl ]
    private let countries: Array<Country> = [ .at, .ca, .fr, .de, .jp, .nl, .pl, .ue, .gb, .us]
    private let categories: Array<Category> = [ .business, .entertainment, .general, .health, .science, .sports, .technology]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Settings")
                .font(.largeTitle)
                .fontWeight(.bold)
                 
            Text("Language")
            Picker("Language", selection: $language) {
                ForEach(languages, id: \.self) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(.segmented)
            
//            Picker("Country", selection: $country) {
//                ForEach(countries, id: \.self) {
//                    Text($0.rawValue)
//                }
//            }
//            .pickerStyle(.wheel)
            
            Text("Category")
            Picker("Category", selection: $category) {
                ForEach(categories, id: \.self) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(.wheel)
            
            Text("Period")
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
            
            Spacer()
            
            HStack {
                Spacer()
                Button("Reset settings") {
                    resetSettings()
                }
                .buttonStyle(.borderedProminent)
                Spacer()
            }
        }
        .padding()
    }
    
    func resetSettings() {
        language = .de
        country = .de
        category = .general
        from = .now
        to = .now
    }
}

struct CriteriaSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SetupView()
    }
}
