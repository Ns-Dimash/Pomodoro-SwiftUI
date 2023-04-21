//
//  FifthPage.swift
//  lecture-05
//
//  Created by Dimash Nsanbaev on 4/6/23.
//

import SwiftUI

struct SetTime: View {
//    init() {
//        UITabBar.appearance().unselectedItemTintColor = .white
//    }
    
    @Binding var selectedFocus:Int
    @Binding var selectedBreak:Int

    var body: some View {
            ZStack{
                SetTime.bg
                dateTime
            }
    }
    
    static var bg:some View{
        Color(red: 28/255, green: 28/255, blue: 30/255).opacity(255).ignoresSafeArea()
        
    }
     var title:some View{
        
        Text("Settings")
            .foregroundColor(.white)
            .font(.system(size: 17))
            .bold()
            .padding(.bottom,34)
    }
      var dateTime:some View{
        
        VStack{
            title
            
            HStack{
                Text("Focus time")
                    .foregroundColor(.white)
                
                Spacer()
                Picker("", selection: $selectedFocus) {
                    ForEach(5...60, id: \.self) { value in
                        Text("\(value)").tag(value)
                    }
                }
                .pickerStyle(.menu)
                .accentColor(Color(red: 235/255, green: 235/255, blue: 245/255).opacity(0.6))
            }.padding(16)
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color(red: 56/255, green: 56/255, blue: 58/255).opacity(1))
                .padding(.leading,16)
            
            HStack{
                Text("Break time")
                    .foregroundColor(.white)
                
                Spacer()
                Picker("", selection: $selectedBreak) {
                    ForEach(5...60, id: \.self) { value in
                        Text("\(value)").tag(value)
                    }
                }
                .pickerStyle(.menu)
                .accentColor(Color(red: 235/255, green: 235/255, blue: 245/255).opacity(0.6))
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


struct SetTime_Previews: PreviewProvider {
    static var previews: some View {
        SetTime()
    }
}
