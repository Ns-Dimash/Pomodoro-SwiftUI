import SwiftUI

struct TabViewShowcase: View {
    @State private var selectedTab: Int = 1 // teaser of the week 3, just keep it simple for now
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ZStack {
                Color.red
                VStack {
                    Text("The First Tab")
                    Button {
                        selectedTab = 3
                    } label: {
                        Text("Change tab to Third")
                    }

                }
            }
            .tabItem {
                Label("First", systemImage: "1.square.fill") // redundant
            }
            .tag(1)
            
            
            ZStack {
                Color.yellow
                Text("The Second Tab")
            }
            .tabItem {
                Label("Second", systemImage: "2.square.fill")
            }
            .tag(2)
            
            
            ZStack {
                Color.blue
                Text("The Third Tab")
            }
            .tabItem {
                Label("Third", systemImage: "3.square.fill")
            }
            .tag(3)
        }
    }
}

struct TabViewShowcase_Previews: PreviewProvider {
    static var previews: some View {
        TabViewShowcase()
    }
}
