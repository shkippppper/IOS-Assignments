//
//  ContentView.swift
//  Assignment24
//
//  Created by Akaki Titberidze on 22.05.24.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Variables
    
    @State private var largeCardText: String = "We love property wrappers and closures"
    @State private var chatColor: Color = .customColorOrange
    @State private var chatColorSecondary: Color = .customColorOrangeLight
    @State private var personColor: Color = .customColorPurple
    @State private var personColorSecondary: Color = .customColorPurpleLight
    @State private var currentColorReload: Color = .customColorBlue
    
    // MARK: Layout & Styling
    
    var body: some View {
        ZStack{
            VStack(spacing: 8){
                Text("Swift UI Exercise")
                    .foregroundStyle(.white)
                    .font(.system(size: 34))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(EdgeInsets(top: 0, leading: 18, bottom: 0, trailing: 0))
                
                HStack(){
                    LargeCardView(
                        color: Color(.customColorYellow),
                        secondaryColor: Color(.customColorYellowLight),
                        icon: "microphoneIcon",
                        text: "ჯუზონები და რამე",
                        largeImage: "guitarImage",
                        largeText: $largeCardText,
                        buttonClicked: {
                            largeCardText = updateLargeCardText(stringNow: largeCardText)
                        }
                        
                    )
                    VStack(spacing: 12){
                        SmallCardView(
                            color: $chatColor,
                            secondaryColor: $chatColorSecondary,
                            icon: "chatIcon",
                            text: "ჩატაობა",
                            largeImage: "chatImage", buttonClicked: {
                                chatColor = getRandomColor(colorNow: chatColor)
                                chatColorSecondary = getRandomColor(colorNow: chatColorSecondary)
                            }
                        )
                        SmallCardView(
                            color: $personColor,
                            secondaryColor: $personColorSecondary,
                            icon: "personIcon",
                            text: "ცეცხლოვანი სიახლეები",
                            largeImage: "megaphoneImage", buttonClicked: {
                                personColor = getRandomColor(colorNow: personColor)
                                personColorSecondary = getRandomColor(colorNow: personColorSecondary)
                            }
                        )
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 232)
                .padding(EdgeInsets(top: 0, leading: 9, bottom: 0, trailing: 23))
                
                List {
                    ForEach(postsData, id: \.id) {post in
                        FactCell(factMain: post.factMain, factSecondary: post.factSecondary)
                            .listRowInsets(EdgeInsets())
                            .padding(0)
                            .listRowBackground(Color.customColorBackground)
                    }
                    .listRowBackground(Color(.customColorBackground))
                }
                .listStyle(PlainListStyle())
                .padding(.top, 10)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.customColorBackground))
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        currentColorReload = getRandomColor(colorNow: currentColorReload)
                    }) {
                        Image("reloadIcon")
                            .frame(maxWidth: 18, maxHeight: 18)
                            .padding(17)
                            .background(Color(currentColorReload))
                            .clipShape(Circle())
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 10))
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            
        }
    }
    
    // MARK: Helper Functions
    
    func getRandomColor(colorNow: Color) -> Color {
        let colors: [Color] = [
            .customColorBlue,
            .customColorOrange,
            .customColorPurple,
            .customColorYellow,
            .customColorOrangeLight,
            .customColorPurpleLight,
            .customColorYellowLight
        ]
        var newColor: Color
        repeat {
            newColor = colors.randomElement() ?? .customColorBlue
        } while newColor == colorNow
        return newColor
    }
    
    func updateLargeCardText(stringNow: String) -> String {
        let texts = [
            "We love property wrappers and closures",
            "Why learn programming with actual code",
            "When logical pathways work as created",
            "Watch learning progress with active coding",
            "Weaving logic patterns with agile creativity",
            "Writing less problematic with analytical coding",
            "We leverage proper workflows and components",
            "Wise learners practice with all concepts"
        ]
        
        var newText: String
        repeat {
            newText = texts.randomElement() ?? "We love property wrappers and closures"
        } while newText == stringNow
        return newText
    }
}

//#Preview {
//    ContentView()
//}
