//
//  ContentView.swift
//  SwiftUI Tutorial: SwiftUI Tutorial: Creating Expandable List
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
        
        VStack {
            
            ForEach(items, id: \.id) { name in
                
                DisclosureGroup(
                
                    content: {
                        ForEach(name.subMenuItems!, id: \.id) { row in
                            HStack {
                                Image(systemName: row.sfSymbol)
                                Spacer()
                                Text(row.name)
                                Spacer()
                            }
                            .padding()
                        }
                    },
                    
                    label: {
                        HStack {
                            Text(name.name)
                                .foregroundColor(.black)
                            Spacer()
                        }
                    }
                    
                )
                .padding()
                .border(.black, width: 1)
                .accentColor(.black)
                
            }
            
        }
        .padding()
        
    } // body
    
} // ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
