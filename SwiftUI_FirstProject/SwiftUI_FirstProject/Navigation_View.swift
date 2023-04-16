//
//  Navigation_View.swift
//  SwiftUI_FirstProject
//
//  Created by Vladislav Matygin on 16/04/2023.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var userBuy: UserBuy
    
    var text: String
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Buy \(text) \(userBuy.caps) caps")
            
            .navigationBarItems(leading:
                Button("Back to Menu") {
                    self.presentation.wrappedValue.dismiss()
                }, trailing:
                HStack {
                    Button("-") {
                        guard self.userBuy.caps > 0 else { return }
                        
                        self.userBuy.caps -= 1
                    }
                
                    Button("+") {
                        self.userBuy.caps += 1
                    }
                }
            )
        }
        .navigationBarBackButtonHidden(true)
        
        .onAppear() {
            self.userBuy.caps = 0
        }
    }
}

class UserBuy: ObservableObject {
    @Published var caps = 0
}

struct Navigation_View: View {
    @ObservedObject var userBuy = UserBuy()
    
    let coffee = "Coffee"
    let tea = "Tea"
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("You have already choosed = \(userBuy.caps) caps")
                Text("What do you want?")
                
                NavigationLink(destination: DetailView(text: coffee), label: {
                    Text(coffee)
                })
                
                NavigationLink(destination: DetailView(text: tea), label: {
                    Text(tea)
                })
                    .navigationBarTitle("Menu", displayMode: .large)
            }
        }
        .environmentObject(userBuy)
    }
}

struct Navigation_View_Previews: PreviewProvider {
    static var previews: some View {
        Navigation_View()
    }
}
