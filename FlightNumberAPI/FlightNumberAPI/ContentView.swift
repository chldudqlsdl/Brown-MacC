//
//  ContentView.swift
//  FlightNumberAPI
//
//  Created by Youngbin Choi on 2023/10/03.
//

import SwiftUI

struct ContentView: View {
    let kacApi = KACApi()
    var body: some View {
        VStack {
            Button {
                kacApi.performRequest()
            } label: {
                Image(systemName: "paperplane.circle")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
