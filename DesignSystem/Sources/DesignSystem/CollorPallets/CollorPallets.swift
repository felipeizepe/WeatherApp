//
//  CollorPallets.swift
//  
//
//  Created by Felipe Izepe on 11/12/21.
//

import SwiftUI

public protocol CollorPallet {

    var palletCode: Int { get }
    var primary: Color { get }
    var secondary: Color { get }
    var tertiary: Color { get }
    var background: Color { get }
    var schemeType: ColorScheme { get }
}

class LightPallet: CollorPallet {

    var palletCode: Int { 0 }
    var primary: Color { .black }
    var secondary: Color { .green }
    var tertiary: Color { .yellow }
    var background: Color { .white }
    var schemeType: ColorScheme { .light }

}

class DarkPallet: CollorPallet {

    var palletCode: Int { 1 }
    var primary: Color { .white }
    var secondary: Color { .blue }
    var tertiary: Color { .yellow }
    var background: Color { .black }
    var schemeType: ColorScheme { .dark }
}
