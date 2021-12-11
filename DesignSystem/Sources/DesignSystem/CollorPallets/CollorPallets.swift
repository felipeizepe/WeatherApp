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
}

class LightPallet: CollorPallet {

    var palletCode: Int { 0 }
    var primary: Color { .black }
    var secondary: Color { Color.cyan }
    var tertiary: Color { Color.yellow }
    var background: Color { Color.white }

}

class DarkPallet: CollorPallet {

    var palletCode: Int { 1 }
    var primary: Color { Color.white }
    var secondary: Color { Color.blue }
    var tertiary: Color { Color.yellow }
    var background: Color { Color.black }

}
