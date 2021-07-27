//
//  ContentView.swift
//  my-swiftui
//
//  Created by yaoyuan on 2021/7/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().environmentObject(ModelData())
        }
    }
}
