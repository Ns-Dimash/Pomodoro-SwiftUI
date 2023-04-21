//
//  SevensPage.swift
//  lecture-05
//
//  Created by Dimash Nsanbaev on 4/7/23.
//

import SwiftUI

struct History: View {
    init() {
        UITabBar.appearance().unselectedItemTintColor = .white
    }
    var body: some View {
            ZStack{
                SetTime.bg
                
                VStack{
                    Spacer()
                    Text("History")
                        .foregroundColor(.white)
                        .font(.system(size: 17))
                        .bold()
                        Spacer()
                    Dates(title: "21.11.21", time: "01:28:32").padding(.top,20)
                    Dates(title: "20.11.21", time: "25:00").padding(.top,20)
                    Dates(title: "19.11.21", time: "25:00").padding(.top,20)
                    Spacer()

                }.padding(.bottom,100)
                
            }
        
    }
    
}

struct Dates:View{
    var title:String
    var time:String
    
    var body:some View{
        VStack{
            Text(title)
                .frame(width: 358,alignment: .leading)
                .foregroundColor(.white)
                .font(.system(size: 20))
                .bold()
            HStack{
                Text("Focus time")
                    .foregroundColor(.white)
                
                Spacer()
                Text(time)
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
        }
        
    }
}

struct History_Previews: PreviewProvider {
    static var previews: some View {
        History()
    }
}
