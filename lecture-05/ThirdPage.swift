//
//  PomodoroFirst.swift
//  lecture-05
//
//  Created by Dimash Nsanbaev on 4/5/23.
//

import SwiftUI

struct ThirdPage: View {
    init() {
        UITabBar.appearance().unselectedItemTintColor = .white
    }
    var body: some View {
        TabView{
            ZStack{
                PomodoroFirst.imageBG
                VStack{
                    PomodoroFirst.title
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
            
            ZStack{
                PomodoroFirst.imageBG
                VStack{
                    PomodoroFirst.title
                        .padding(.bottom,50)
                    
                    circleProgress(progress: 1,time: "04:48",text: "Break")
                        .padding(.top,30)
                    HStack{
                        StartPause(image: "pause").padding(.trailing,80)
                        StartPause(image: "square.fill")
                    }
                    .padding(.top,50)
                }
                
            }.tabItem {
                Label("Settings",image: "secondIcon") // redundant
            }
            
            ZStack{
                PomodoroFirst.imageBG
                VStack{
                    PomodoroFirst.title
                        .padding(.bottom,50)
                    circleProgress(progress: 1,time: "04:48",text: "Break")
                        .padding(.top,30)
                    HStack{
                        StartPause(image: "pause").padding(.trailing,80)
                        StartPause(image: "square.fill")
                    }
                    .padding(.top,50)
                }
                
            }.tabItem {
                Label("History", image: "thirdIcon")
                
            }
        }.tint(.white)
//            .accentColor(Color?)
    }
}






struct ThirdPage_Previews: PreviewProvider {
    static var previews: some View {
        ThirdPage()
    }
}
