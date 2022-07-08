//
//  ContentView.swift
//  SearchBar
//
//  Created by Augustin Diabira on 08/07/2022.
//

import SwiftUI

struct ContentView: View {
   private var countries = listOfCountries
    @State var searchCountry = ""
    var body: some View {
        NavigationView {
            List{
                ForEach(countriesFound, id: \.self){country in
                    HStack {
                        Text(country.capitalized)
                        Image(systemName: "person.fill" )
                    }
                }
            }.searchable(text: $searchCountry)
                .navigationTitle("Countries")
        }
    }
    var countriesFound:[String] {
        let sCountries = countries.map{$0.lowercased()}
        
        return searchCountry == "" ? sCountries : sCountries.filter{
            $0.contains(searchCountry.lowercased())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


