//
//  sixthPage.swift
//  lecture-05
//
//  Created by Dimash Nsanbaev on 4/7/23.
//

import SwiftUI

struct SixthPage: View {
    @State private var textValue: String = "05:00"

    init() {
        UITabBar.appearance().unselectedItemTintColor = .white
    }
    var body: some View {
        TabView{
            ZStack{
                FifthPage.bg
                VStack{
                    HStack{
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.white)
                        Spacer()
                        Text("Settings")
                            .foregroundColor(.white)
                            .font(.system(size: 17))
                            .bold()
                        Spacer()
                        Text("Save")
                            .foregroundColor(.white)
                            .font(.system(size: 17))
                            
                    }.padding(.bottom,40)
                        .padding()
                    
                        
                    
                    HStack{
                        Text("Focus time")
                            .foregroundColor(.white)
                        
                        Spacer()
                        Text("25:00")
                            .foregroundColor(Color(red: 235/255, green: 235/255, blue: 245/255).opacity(0.6))
                    }.padding(16)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color(red: 56/255, green: 56/255, blue: 58/255).opacity(1))
                        .padding(.leading,16)
                    
                    HStack{
                        
                        Text("Break time")
                            .foregroundColor(.white)
                        Spacer()
                        
                        TextField("Enter a number", text: $textValue)
                            .keyboardType(.numberPad) // Set the keyboardType to numberPad
                            .padding(.leading,223)
                            .foregroundColor(.white)
                        
                        
                    }.padding(16)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color(red: 56/255, green: 56/255, blue: 58/255).opacity(1))
                        .padding(.leading,16)
                    //                rgba(56, 56, 58, 1)
                    
                    Spacer()
                }
            }.tabItem {
                Label("Main", image: "home2")
            }
            Text("Second")
                .tabItem {
                    Label("Settings",image: "Settings2") // redundant
                }
            Text("Third")
                .tabItem {
                    Label("History", image: "thirdIcon")
                }
        }.accentColor(.white)
        
    }
}

struct SixthPage_Previews: PreviewProvider {
    static var previews: some View {
        SixthPage()
    }
}
