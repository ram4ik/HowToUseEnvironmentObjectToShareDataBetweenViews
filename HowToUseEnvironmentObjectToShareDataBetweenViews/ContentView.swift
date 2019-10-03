//
//  ContentView.swift
//  HowToUseEnvironmentObjectToShareDataBetweenViews
//
//  Created by ramil on 03/10/2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI

class UserSettings: ObservableObject {
    @Published var score = 0
}

struct ContentView: View {
    @EnvironmentObject var settings: UserSettings

    var body: some View {
        NavigationView {
            VStack {
                // A button that writes to the environment settings
                Button(action: {
                    self.settings.score += 1
                }) {
                    Text("Increase Score")
                }

                NavigationLink(destination: DetailView()) {
                    Text("Show Detail View")
                }
            }
        }
    }
}

struct DetailView: View {
    @EnvironmentObject var settings: UserSettings

    var body: some View {
        // A text view that reads from the environment settings
        Text("Score: \(settings.score)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
