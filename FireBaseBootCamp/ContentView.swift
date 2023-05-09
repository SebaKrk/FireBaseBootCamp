//
//  ContentView.swift
//  FireBaseBootCamp
//
//  Created by Sebastian Sciuba on 08/05/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        Button("Crash 1") {
          fatalError("Crash was triggered")
        }
        
        Button("Crash 2") {
            let myString: String? =  nil
            let string2 = myString!
        }
        
        Button("Crash 3") {
            let array: [String] = []
            let item = array[0]
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
