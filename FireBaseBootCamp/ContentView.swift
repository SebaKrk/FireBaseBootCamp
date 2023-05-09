//
//  ContentView.swift
//  FireBaseBootCamp
//
//  Created by Sebastian Sciuba on 08/05/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        Button("Crash") {
          fatalError("Crash was triggered")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
