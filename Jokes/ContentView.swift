//
//  ContentView.swift
//  Jokes
//
//  Created by sanjithsethu on 18/12/21.
//

import SwiftUI

struct ContentView: View {
    
    var jokes = [Joke(setup: "Why did the chicken cross the road?",
                      punchline: "To get to the other side!"),
                 Joke(setup: "Why couldn't the bicycle stand up?",
                      punchline: "It was two tired!"),
                 Joke(setup: "Is this pool safe for diving?",
                      punchline: "It deep ends"),
                 Joke(setup: "Why did the can-crusher quit his job?",
                      punchline: "Because it was soda-pressure"),
                 Joke(setup: "Why do bees hum?",
                      punchline: "Because they don’t know the words"),
                 Joke(setup: "I'm reading a book on the history of glue",
                      punchline: "I can’t seem to put it down"),
                 Joke(setup: "What do you call a cheese that isn't yours?", punchline: "Nacho Cheese"),
                 Joke(setup: "How many apples grow on trees?",
                      punchline: "All of them"),
                 Joke(setup: "Dad, I'm Hungry",
                      punchline: "Hi Hungry, I'm Dad"),
                 Joke(setup: "What do you get when you cross a snowman with a vampire",
                      punchline: "Frostbite"),
                 Joke(setup: "Where do you learn to make ice cream?",
                      punchline: "Sunday School"),
                 Joke(setup: "Did you hear about the guy who invented the knock knock joke?",
                      punchline: "He won the 'no-bell' preize"),
                 Joke(setup: "My Wife is on a tropical food diet, the house is full of the stuff",
                      punchline: "It's enough to make a mango crazy")]
    
    @State var showPunchline = false
    @State var currentJoke = 0
    @State var isFeedbackPresented = false
    @State var isFeedbackResponsePresented = false
    @State var isFeedbackPositive = false
    @State var punchlineSize: CGFloat = 0.1
    @State var punchlineRotation: Angle = .zero
    @State var opacity: Double = 0
    @State var tapToContinueOffset: CGFloat = 50
    
    var body: some View {
        VStack {
            Text(jokes[currentJoke].setup)
                .fontWeight(.heavy)
                .foregroundColor(Color(red: 0.5882352941176471, green: 0.40784313725490196, blue: 0.44313725490196076))
                .font(.system(size: 26))
                .multilineTextAlignment(.center)
                .padding(.all)
            Button("Huh? What? Continue pls") {
                withAnimation {
                    showPunchline = true
                }

            }
            .padding()
            .background(Color(red: 0.6901960784313725, green: 0.7686274509803922, blue: 0.6941176470588235))
            .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.5882352941176471, green: 0.40784313725490196, blue: 0.44313725490196076)/*@END_MENU_TOKEN@*/)
            .cornerRadius(20)
            .font(.system(size: 24))
            .padding()
            
            if showPunchline{
                Text(jokes[currentJoke].punchline)
                    .fontWeight(.heavy)
                    .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.5882352941176471, green: 0.40784313725490196, blue: 0.44313725490196076)/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 26))
                    .padding()
                    .scaleEffect(punchlineSize)
                    .rotationEffect(punchlineRotation)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            punchlineSize = 1
                            punchlineRotation = Angle(degrees: 360 * 2)
                            opacity = 1
                            tapToContinueOffset = 0
                        }
                    }
                    .onDisappear {
                        punchlineSize = 0.1
                        punchlineRotation = .zero
                        opacity = 0
                        tapToContinueOffset = 50
                    }
                
                Button("Vote"){
                    isFeedbackPresented = true
                }
                .padding()
                .background(Color(red: 0.6901960784313725, green: 0.7686274509803922, blue: 0.6941176470588235))
                .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.5882352941176471, green: 0.40784313725490196, blue: 0.44313725490196076)/*@END_MENU_TOKEN@*/)
                .font(.system(size: 30))
                .cornerRadius(20)
                .padding()
                
                Text("Tap to continue")
                    .italic()
                    .fontWeight(.heavy)
                    .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.5882352941176471, green: 0.40784313725490196, blue: 0.44313725490196076)/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 15))
                    .padding()
                    .opacity(opacity)
                    .offset(x: 0, y: tapToContinueOffset)
                
                
                
            } else {
                Text("").padding()
                Text("").padding()
                Text("").padding()
                Text("").padding()
                Text("").padding()
                
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.8705882352941177, green: 0.8588235294117647, blue: 0.8235294117647058))
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            if showPunchline{
                print("The current joke is \(currentJoke)")
                currentJoke += 1
                print("We have increased it to \(currentJoke)")
                if currentJoke == jokes.count {
                    print("Reset!")
                    currentJoke = 0
                }
                showPunchline = false
            }
        }
        .alert(isPresented: $isFeedbackPresented) {
            Alert(title: Text("Did you like the last joke?"),
                  primaryButton: Alert.Button.default(Text("Yes")) {
                    print("Yay! Thank you! 🥰")
                    isFeedbackPositive = true
                    isFeedbackResponsePresented = true
                  },
                  secondaryButton: Alert.Button.default(Text("No")) {
                    print("What! You are awful 😡🤮")
                    isFeedbackPositive = false
                    isFeedbackResponsePresented = true
                  })
        }
        .sheet(isPresented: $isFeedbackResponsePresented) {
            FeedbackResponseView(isPositive: isFeedbackPositive)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.8705882352941177, green: 0.8588235294117647, blue: 0.8235294117647058))
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
