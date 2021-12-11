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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ReportViewModel(locationId: 4118)
        ReportView(viewModel: viewModel)
    }
}
