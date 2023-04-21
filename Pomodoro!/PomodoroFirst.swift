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
    @State private var selectedTab = 0
    @State var selectedFocus = 5
    @State var selectedBreak = 5
    
    
    var body: some View {
        TabView(selection: $selectedTab){
            
            FirstPage(selectedFocus: $selectedFocus, selectedBreak: $selectedBreak)
                .tabItem {
                    if selectedTab == 0 {
                        Label("Main", image: "firstIcon")
                    } else {
                        Label("Main", image: "home2")
                    }
                }
                .tag(0)
            
            SetTime(selectedFocus: $selectedFocus, selectedBreak: $selectedBreak)
                .tabItem {
                    if selectedTab == 1 {
                        Label("Settings",image: "Settings2")
                        
                    } else {
                        Label("Settings",image: "secondIcon")
                        
                    }
                }
                .tag(1)
            
            History()
                .tabItem {
                    if selectedTab == 2 {
                        Label("History", image: "last")
                        
                    } else {
                        Label("History", image: "thirdIcon")
                        
                    }
                }
                .tag(2)
        }.accentColor(.white)
        
    }
    
    
}


struct FirstPage: View {
    @State var presentSheet = false
    @State var background = "pomodoroBg"
    @State private var selectedButtonIndex = 3
    
    @Binding var selectedFocus:Int
    @Binding var selectedBreak:Int
    
    @State var timer: Timer?
    @State var timeRemaining: TimeInterval = 25 * 60 // 25 minutes in seconds
    @State var breakTimeRemaining: TimeInterval = 5 * 60 // 5 minutes in seconds
    @State var isPaused: Bool = true
    @State var isBreak: Bool = false
    
    let buttonWidth: CGFloat = 56
    let buttonHeight: CGFloat = 56
    
    var chooseColor = Color(red: 47 / 255, green: 47 / 255, blue: 51 / 255).opacity(1)
    var emptyColor = Color(red: 234 / 255, green: 234 / 255, blue: 234 / 255).opacity(1)
    
    
    var body: some View {
        ZStack{
            imageBG
            VStack{
                title
                    .padding(.top,164)
                progress
                    .padding(.top,52)
                Spacer()
            }
            
        }
    }
    
    var imageBG: some View {
        Image(background)
            .resizable()
            .frame(width: 506,height: 900)
        
    }
    
    var title: some View {
        Button(action: { presentSheet.toggle()}) {
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
        }.sheet(isPresented: $presentSheet) {
            VStack{
                HStack{
                    Spacer()
                    Text("Focus Category")
                        .padding(.leading,30)
                        .font(.custom("SF Pro Display", size: 16))
                    Spacer()
                    Image(systemName: "xmark")
                }
                .padding(.top,0)
                Spacer()
                inBottomSheet
                    .frame(alignment: .center)
            }
            .padding()
            .presentationDetents([.height(310)])
        }
        
    }
    var inBottomSheet:some View{
        VStack(spacing: 20){
            HStack(spacing: 14){
                Button(action: {
                    background = "greenbg"
                    selectedButtonIndex = 1
                    
                }) {
                    Text("Work")
                        .frame(width: 172,height: 60)
                        .foregroundColor(selectedButtonIndex == 1 ? .white : .black)
                        .background(selectedButtonIndex == 1 ? chooseColor : emptyColor)
                        .cornerRadius(16)
                }
                Button(action: {
                    background = "secondsbg"
                    selectedButtonIndex = 2}) {
                        Text("Study")
                            .frame(width: 172,height: 60)
                            .foregroundColor(selectedButtonIndex == 2 ? .white : .black)
                            .background(selectedButtonIndex == 2 ? chooseColor : emptyColor)
                            .cornerRadius(16)
                    }
            }
            HStack(spacing: 14){
                
                Button(action: {
                    background = "pomodoroBg"
                    selectedButtonIndex = 3
                }) {
                    Text("Workout")
                        .frame(width: 172,height: 60)
                        .foregroundColor(selectedButtonIndex == 3 ? .white : .black)
                        .background(selectedButtonIndex == 3 ? chooseColor : emptyColor)
                        .cornerRadius(16)
                }
                Button(action: {
                    background = "thirdbg"
                    selectedButtonIndex = 4
                }) {
                    Text("Reading")
                        .frame(width: 172,height: 60)
                        .foregroundColor(selectedButtonIndex == 4 ? .white : .black)
                        .background(selectedButtonIndex == 4 ? chooseColor : emptyColor)
                        .cornerRadius(16)
                }
            }
            HStack(spacing: 14){
                Button(action: {
                    background = "fourthbg"
                    selectedButtonIndex = 5
                }) {
                    Text("Meditation")
                        .frame(width: 172,height: 60)
                        .foregroundColor(selectedButtonIndex == 5 ? .white : .black)
                        .background(selectedButtonIndex == 5 ? chooseColor : emptyColor)
                        .cornerRadius(16)
                }
                Button(action: {
                    background = "fifthbg"
                    selectedButtonIndex = 6
                }) {
                    Text("Others")
                        .frame(width: 172,height: 60)
                        .foregroundColor(selectedButtonIndex == 6 ? .white : .black)
                        .background(selectedButtonIndex == 6 ? chooseColor : emptyColor)
                        .cornerRadius(16)
                }
            }
        }
    }
    
    
    
    var progress: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(
                        Color.gray.opacity(0.4),
                        lineWidth: 6
                    )
                
                
                Circle()
                    .trim(from: 0.0, to: progressValue)
                    .stroke(style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color(red: 255, green: 255, blue: 255))
                    .rotationEffect(Angle(degrees: -90))
                VStack{
                    
                    Text(formatTime(isBreak ? breakTimeRemaining : timeRemaining))
                        .foregroundColor(.white)
                        .font(.custom("SF Pro Display", size: 44))
                        .padding(.bottom,10)
                    Text(isBreak ? "Break" : "Focus on your task")
                        .font(.custom("SF Pro Display", size: 16))
                        .foregroundColor(.white)
                }
            }.frame(width: 248)
            
            HStack(spacing: 80){
                Button(action: {
                    isPaused.toggle()
                    if isPaused {
                        timer?.invalidate()
                    } else {
                        startTimer()
                    }
                }, label: {
                    
                    ZStack{
                        Circle()
                            .frame(width: 56)
                            .foregroundColor(Color.white).opacity(0.3)
                        
                        
                        Image(systemName: isPaused ? "play.fill" : "pause.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                        
                    }
                })
                .frame(width: buttonWidth, height: buttonHeight)
                .foregroundColor(.white)
                
                Button(action: {
                    stopTimer()
                }, label: {
                    
                    ZStack{
                        Circle()
                            .frame(width: 56)
                            .foregroundColor(Color.white).opacity(0.3)
                        
                        
                        Image(systemName: "stop.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                        
                    }
                })
                .frame(width: buttonWidth, height: buttonHeight)
                .foregroundColor(.white)
                .cornerRadius(100)
            }
            .padding(.top, 60)
            
            Spacer()
        }
    }
    
    var progressValue: CGFloat {
        let totalTime = isBreak ? breakTimeRemaining : timeRemaining
        let maxTime = isBreak ? 5 * 60 : 25 * 60
        return 1.0 - CGFloat(totalTime / Double(maxTime))
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else if breakTimeRemaining > 0 {
                if !isBreak {
                    timeRemaining = TimeInterval(selectedFocus * 60) // reset pomodoro timer
                    isBreak = true
                }
                breakTimeRemaining -= 1
            } else {
                stopTimer()
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timeRemaining = 25 * 60 // reset pomodoro timer
        breakTimeRemaining = 5 * 60 // reset break timer
        isPaused = false
        isBreak = false
    }
    
    func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    
}

// MARK: - SecondPage

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



struct PomodoroFirst_Previews: PreviewProvider {
    static var previews: some View {
        PomodoroFirst()
    }
}



//StartPause(image: "pause").padding(.trailing,80)
//StartPause(image: "square.fill")
