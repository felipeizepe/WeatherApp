//
//  ReportView.swift
//  FaireWeather
//
//  Created by Felipe Izepe on 11/12/21.
//

import SwiftUI

struct ReportView: View {

    @ObservedObject var viewModel: ReportViewModel

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(viewModel.report?.locationName ?? "Loading...").font(.system(size: 42))
                    .padding(.bottom, 16)
                    .padding(.leading, 8)
                HStack {
                    Text("Max: ").font(.system(size: 21))
                    Text(viewModel.minValue).font(.system(size: 21))
                }

                HStack {
                    Text("Min: ").font(.system(size: 21))
                    Text(viewModel.maxValue).font(.system(size: 21))
                }

                HStack {
                    Spacer()
                    Image(viewModel.imageName)
                        .resizable()
                        .frame(width: 125, height: 125, alignment: .center)
                        .clipShape(Circle())
                        .overlay {
                            Circle().stroke(.blue, lineWidth: 2)
                        }
                    Spacer()
                }

                Spacer()
            }
            Spacer()
        }
        .foregroundColor(viewModel.selectdPallet.primary)
        .padding()
        .background(viewModel.selectdPallet.background)
        .preferredColorScheme(viewModel.selectdPallet.schemeType)
        .onAppear {
            viewModel.searchWeather()
        }
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ReportViewModel(locationId: 4118)
        ReportView(viewModel: viewModel)
    }
}
