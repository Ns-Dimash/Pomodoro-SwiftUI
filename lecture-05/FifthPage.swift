//
//  FifthPage.swift
//  lecture-05
//
//  Created by Dimash Nsanbaev on 4/6/23.
//

import SwiftUI

struct FifthPage: View {
    init() {
        UITabBar.appearance().unselectedItemTintColor = .white
    }
    var body: some View {
        TabView{
            ZStack{
                FifthPage.bg
                FifthPage.dateTime
            }
            
            .tabItem {
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
    
    static var bg:some View{
        Color(red: 28/255, green: 28/255, blue: 30/255).opacity(255).ignoresSafeArea()
        
    }
    static var title:some View{
        
        Text("Settings")
            .foregroundColor(.white)
            .font(.system(size: 17))
            .bold()
            .padding(.bottom,34)
    }
    static var dateTime:some View{
        
        VStack{
            title
            
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
                Text("05:00")
                    .foregroundColor(Color(red: 235/255, green: 235/255, blue: 245/255).opacity(0.6))
            }.padding(16)
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color(red: 56/255, green: 56/255, blue: 58/255).opacity(1))
                .padding(.leading,16)
            //                rgba(56, 56, 58, 1)
            
            Spacer()
        }
    }
    
}


struct FifthPage_Previews: PreviewProvider {
    static var previews: some View {
        FifthPage()
    }
}
