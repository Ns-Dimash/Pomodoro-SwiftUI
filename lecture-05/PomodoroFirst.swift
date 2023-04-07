//
//  PomodoroFirst.swift
//  lecture-05
//
//  Created by Dimash Nsanbaev on 4/5/23.
//

import SwiftUI

struct PomodoroFirst: View {
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
                    circleProgress(progress: 0,time: "25:00",text: "Focus on your task")
                        .padding(.top,30)
                    HStack{
                        StartPause(image: "play").padding(.trailing,80)
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
            
            ZStack{
                PomodoroFirst.imageBG
                VStack{
                    PomodoroFirst.title
                        .padding(.bottom,50)
                    circleProgress(progress: 0,time: "25:00",text: "Focus on your task")                        .padding(.top,30)
                    HStack{
                        StartPause(image: "play").padding(.trailing,80)
                        StartPause(image: "square.fill")
                    }
                    .padding(.top,50)
                }
                
            }.tabItem {
                Label("History", image: "thirdIcon")
                
            }
        }.accentColor(.white)
        
    }
    
    
    static var imageBG: some View {
        Image("pomodoroBg")
            .resizable()
            .frame(width: 506,height: 900)
        
    }
    
    static var title: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                .fill(Color.white).opacity(0.3)
                .frame(width: 170,height: 36)
            HStack{
                Image("ruchka")
                Text("Focus Category")
                    .foregroundColor(.white)
                    .font(.custom("SF Pro Display", size: 16))
            }
        }
    }
    
}

struct circleProgress: View {
    var progress:CGFloat
    var time:String
    var text:String
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    Color.gray.opacity(0.4),
                    lineWidth: 6
                )
            Circle()
                .trim(from: 0.758, to: progress) //
                .stroke(
                    Color(red: 255, green: 255, blue: 255).opacity(1),
                    lineWidth: 6
                )
            VStack{
                
                Text(time)
                    .foregroundColor(.white)
                    .font(.custom("SF Pro Display", size: 44))
                    .padding(.bottom,10)
                
                Text(text)
                    .font(.custom("SF Pro Display", size: 16))
                    .foregroundColor(.white)
            }
        }.frame(width: 248)
    }
}
struct StartPause: View {
    var image:String
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 56)
                .foregroundColor(Color.white).opacity(0.3)
            
            
            Image(systemName: image)
                .foregroundColor(.white)
                .font(.system(size: 25))
            
        }
    }
}


struct PomodoroFirst_Previews: PreviewProvider {
    static var previews: some View {
        PomodoroFirst()
    }
}
