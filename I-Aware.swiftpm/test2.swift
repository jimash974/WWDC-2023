//
//  test2.swift
//  I-Aware
//
//  Created by Jeremy Christopher on 12/04/23.
//

import SwiftUI

struct test2: View {
    var body: some View {
        ZStack {
            Color.gray.opacity(0.5).edgesIgnoringSafeArea(.all)
            NavigationView {
                List {
                    NavigationLink(destination: DetailView().transition(.scale)) {
                        Text("Go to Detail View")
                    }
                }
                .navigationBarTitle("Main View")
            }
            .navigationViewStyle(StackNavigationViewStyle()) // Add this modifier to enable transition animations

        }
    }
}

struct test2_Previews: PreviewProvider {
    static var previews: some View {
        test2()
    }
}

struct DetailView: View {
    var body: some View {
        Text("This is the Detail View")
            .navigationBarTitle("Detail View")
    }
}
