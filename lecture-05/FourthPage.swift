//
//  FourthPage.swift
//  lecture-05
//
//  Created by Dimash Nsanbaev on 4/6/23.
//

import SwiftUI

struct FourthPage: View {
    @State private var presentSheet = false
    @State private var title = ""
    @State private var link = ""
    init() {
        UITabBar.appearance().unselectedItemTintColor = .white
    }
    
    var body: some View {
        TabView{
            ZStack{
                PomodoroFirst.imageBG
                VStack{
                    Button(action: { presentSheet.toggle()}) {
                        PomodoroFirst.title
                    }.sheet(isPresented: $presentSheet) {
                        bottomSheet
                    }
                    .padding(.bottom,50)
                    circleProgress(progress: 0.9,time: "04:48",text: "Break")
                        .padding(.top,30)
                    HStack{
                        StartPause(image: "pause").padding(.trailing,80)
                        StartPause(image: "square.fill")
                    }
                    .padding(.top,50)
                }
                
            }.tabItem {
                Label("Main", image: "firstIcon")
            }
            Text("Second")
                .tabItem {
                    Label("Settings",image: "secondIcon") // redundant
                }
            Text("Third")
                .tabItem {
                    Label("History", image: "thirdIcon")
                }
        }.accentColor(.white)
    }
    
    var bottomSheet:some View{
        VStack{
            HStack{
                Spacer()
                Text("Focus Category")
                    .frame(width: 120,height: 24,alignment: .center)
                    .font(.custom("SF Pro Display", size: 16))
                    
                Image(systemName: "xmark")
                    .padding(.leading,85)
                    .padding(.trailing,20)
                    
            }
            .padding(.top,20)
            Spacer()
           inBottomSheet
            .frame(alignment: .center)
        }
        .presentationDetents([.height(270)])
    }
    var inBottomSheet:some View{
        Group{
            HStack{
                Text("Work")
                    .frame(width: 172,height: 60)
                    .background(Color(red: 234 / 255, green: 234 / 255, blue: 234 / 255).opacity(1))
                    .cornerRadius(16)
                Text("Study")
                    .frame(width: 172,height: 60)
                    .background(Color(red: 234 / 255, green: 234 / 255, blue: 234 / 255).opacity(1))
                    .cornerRadius(16)
            }
            HStack{
                Text("Workout")
                    .frame(width: 172,height: 60)
                    .background(Color(red: 47 / 255, green: 47 / 255, blue: 51 / 255).opacity(1))
                    .foregroundColor(.white)
                    .cornerRadius(16)
                Text("Reading")
                    .frame(width: 172,height: 60)
                    .background(Color(red: 234 / 255, green: 234 / 255, blue: 234 / 255).opacity(1))
                    .cornerRadius(16)
            }
            HStack{
                Text("Meditation")
                    .frame(width: 172,height: 60)
                    .background(Color(red: 234 / 255, green: 234 / 255, blue: 234 / 255).opacity(1))
                    .cornerRadius(16)
                Text("Others")
                    .frame(width: 172,height: 60)
                    .background(Color(red: 234 / 255, green: 234 / 255, blue: 234 / 255).opacity(1))
                    .cornerRadius(16)
            }
        }
    }
}

struct FourthPage_Previews: PreviewProvider {
    static var previews: some View {
        FourthPage()
    }
}
