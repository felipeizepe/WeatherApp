//
//  SearchView.swift
//  FaireWeather
//
//  Created by Felipe Izepe on 11/12/21.
//

import SwiftUI

struct SearchView: View {

    @ObservedObject var viewModel: SearchViewModel

    @State private var latitude: String = ""
    @State private var longitude: String = ""

    var body: some View {
        NavigationView {
            HStack {
                VStack(alignment: .leading) {
                    Text("Faire Weather").font(.system(size: 42))
                        .padding(.bottom, 16)
                    Text(viewModel.searchLocationText)
                    HStack {
                        TextField(viewModel.lattitudeText, text: $latitude)
                            .keyboardType(.numberPad)
                            .zIndex(1)
                        TextField(viewModel.longitudeText, text: $longitude)
                            .keyboardType(.numberPad)
                            .zIndex(1)
                        Button(viewModel.searchText) {
                            viewModel.searchLocation(lattitude: latitude, longitude: longitude)
                        }
                    }
                    .padding(.bottom, 8)

                    Text("Location").font(.system(size: 21))
                    List {
                        ForEach(viewModel.locations) { item in
                            HStack {
                                Text(item.name)
                                Text(" - ")
                                Text(item.id)
                            }
                        }
                    }
                    .border(viewModel.selectdPallet.secondary)
                    .overlay(Group {
                        if viewModel.locations.isEmpty {
                            Text("Please search for a location.")
                        }
                    })
                    Spacer()
                }
                .padding()
                Spacer()
            }
            .foregroundColor(viewModel.selectdPallet.primary)
            .toolbar {
                Button("Color") {
                    viewModel.nextPallet()
                }
            }
            .padding()
            .background(viewModel.selectdPallet.background)
            .preferredColorScheme(viewModel.selectdPallet.schemeType)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: SearchViewModel())
    }
}
