//
//  FirstPage.swift
//  Pomodoro!
//
//  Created by Dimash Nsanbaev on 4/21/23.
//

import SwiftUI

struct FirstPage: View {
    @State var presentSheet = false
    @State var background = "pomodoroBg"
    @State private var selectedButtonIndex = 3
    
    @Binding var selectedFocus:Int
    @Binding var selectedBreak:Int
    
    var chooseColor = Color(red: 47 / 255, green: 47 / 255, blue: 51 / 255).opacity(1)
    var emptyColor = Color(red: 234 / 255, green: 234 / 255, blue: 234 / 255).opacity(1)


    var body: some View {
        ZStack{
            imageBG
            VStack{
                title
                    .padding(.top,164)
                circleProgress(progress: 0,time: "25:00",text: "Focus on your task")
                    .padding(.top,52)
                HStack{
                    StartPause(image: "play").padding(.trailing,80)
                    StartPause(image: "square.fill")
                }
                .padding(.top,60)
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



struct FirstPage_Previews: PreviewProvider {
    static var previews: some View {
        FirstPage(selectedFocus: selectedFocus, selectedBreak: selectedBreak)
    }
}
