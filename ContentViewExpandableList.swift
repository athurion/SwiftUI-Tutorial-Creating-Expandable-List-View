//
//  ContentView.swift
//  SwiftUI Tutorial: SwiftUI Tutorial: Creating Expandable List View
//
//  Created by Alvin Sosangyo on 07/13/22.
//

import SwiftUI

// Best coding practice: This struct should be placed on a separate file.
struct SFMenu: Identifiable {
    var id = UUID()
    var name: String
    var sfSymbol: String
    var subMenuItems: [SFMenu]?
    
    // List
    static let iPhone = SFMenu(name: "iPhone", sfSymbol: "iphone")
    static let keyboard = SFMenu(name: "Keyboard", sfSymbol: "keyboard")
    static let mouse = SFMenu(name: "Magicmouse", sfSymbol: "magicmouse")
    
    static let person = SFMenu(name: "Person", sfSymbol: "person")
    static let faceSmiling = SFMenu(name: "Smiling", sfSymbol: "face.smiling")
    
    static let cross = SFMenu(name: "Cross", sfSymbol: "cross")
    static let faceMask = SFMenu(name: "Face Mask", sfSymbol: "facemask.fill")
    
    // Groups
    static let devices = SFMenu(name: "Devices", sfSymbol: "display", subMenuItems: [
        .iPhone, .keyboard, .mouse
    ])
    static let human = SFMenu(name: "Human", sfSymbol: "person.crop.circle", subMenuItems: [
        .person, .faceSmiling
    ])
    static let health = SFMenu(name: "Health", sfSymbol: "heart", subMenuItems: [
        .cross, .faceMask
    ])
    
}

struct ContentView: View {
    let items: [SFMenu] = [.devices, .human, .health]

    var body: some View {
        
        List(items, children: \.subMenuItems) { row in
            Image(systemName: row.sfSymbol)
            Text(row.name)
        }
        
    }
    
} // ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
