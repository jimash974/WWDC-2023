//
//  CallView.swift
//  I-Aware
//
//  Created by Jeremy Christopher on 13/04/23.
//

import SwiftUI
import AVFoundation


struct CallView: View {
    @State private var popUp = false
    @State private var answer = ""
    @State private var image = ""
    @State private var nextPage = false
    @Binding var score: Int
    @State var opacity = 1.0
    @State var opacity2 = 0.0

    @State var audioPlayer: AVAudioPlayer!
    @State var call: AVAudioPlayer!

    @State private var callSound = false
    
    @State var player: AVPlayer!

    
    
    
    var body: some View {
        ZStack{
            Color("MediumBlue")
                .edgesIgnoringSafeArea(.all)
            
//            NavigationView{
                VStack(spacing: 0){
                    VStack{
                        VStack(spacing: 10){
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100)
                            Text("Unknown")
                                .font(.system(size: 30))
                                .bold()
                            Text("(+62)8184462923")
                                .font(.system(size: 20))
                                .bold()
                            Text("01.34")
                                .font(.system(size: 15))
                                .bold()
                        }
                        .padding(.top, 60)
                        
                        HStack{
                            Spacer()
                            Image(systemName: "mic.slash.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60)
                            Image(systemName: "circle.grid.3x3.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60)
                            Image(systemName: "speaker.wave.2.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60)
                                .foregroundColor(.white)
                                .background(Color.black)
                                .clipShape(RoundedRectangle(cornerRadius: 30))

                            Spacer()
                        }
                        .padding(.top, 20)
                        Spacer()
                    }
                    .frame(height: 500)
                    .background(Color("MediumGray"))
                    
                    VStack(spacing: 15){
                        Text("What would you do ?")
                            .font(.system(size: 25))
                            .bold()
                            .padding(30)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.white, lineWidth: 8)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                
                            )
                            .background(Color("MediumGray"))
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                        
                        HStack{
                            VStack(){
                                Text("Hang Up the phone")
                                    .font(.system(size: 15))
                                    .bold()
                                Text("to ignore the person")
                                    .font(.system(size: 12))
                                    .bold()
                            }
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.white, lineWidth: 8)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                
                            )
                            .background(Color("MediumGray"))
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .onTapGesture {
                                popUp = true
                                answer = "CORRECT"
                                image = "checkmark.seal.fill"
                                score = score + 1
                            }
                            
                            VStack(){
                                Text("Respond the person ")
                                    .font(.system(size: 15))
                                    .bold()
                                Text("to give the information")
                                    .font(.system(size: 12))
                                    .bold()
                            }
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.white, lineWidth: 8)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                            )
                            .background(Color("MediumGray"))
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .onTapGesture {
                                popUp = true
                                answer = "INCORRECT"
                                image = "x.circle.fill"
                            }
                        }
                    }
                    .opacity(opacity2)
                    .animation(Animation.easeInOut(duration: 1).delay(15))
                    .onAppear {
                        withAnimation{
                            opacity2 = 1.0
                        }
                    }
                    .padding()
                    .padding(.top, 20)
                    Spacer()
                }
                .onAppear{
                    if callSound{
                        if let soundURL = Bundle.main.url(forResource: "call", withExtension: "mp3") {
                            do {
                                self.call = try AVAudioPlayer(contentsOf: soundURL)
                            } catch {
                                print("Error loading sound file: \(error.localizedDescription)")
                            }
                        }
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: {
//                            call.play()
//                        })
                    }
                }
//                .background(Color("MediumBlue"))
//            }
            
            ZStack{
                Color(.black)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Image(systemName: "speaker.plus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80)
                        .foregroundColor(.white)
                        .padding(.bottom, 40)
                        
                        
                    Text("Turn On Your Volume")
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                }
            }
            .opacity(opacity)
            .animation(Animation.easeInOut(duration: 1).delay(3))
            .onAppear {
                withAnimation{
                    opacity = 0.0
                }
                if let soundURL = Bundle.main.url(forResource: "ringing", withExtension: "mp3") {
                    do {
                        self.audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                    } catch {
                        print("Error loading sound file: \(error.localizedDescription)")
                    }
                }
//                audioPlayer.play()
//                callSound = true
            }

            
            if popUp{
                CallPopUpView(popUp: $popUp, answer: $answer, image: $image, nextPage: $nextPage)
            }
            if nextPage{
                EmailView(score: $score)
                    .transition(.move(edge: .trailing))
            }
        }
    }
}

//struct CallView_Previews: PreviewProvider {
//    static var previews: some View {
//        CallView()
//    }
//}



struct CallPopUpView: View{
    @Binding var popUp: Bool
    @Binding var answer: String
    @Binding var image: String
    @Binding var nextPage: Bool
    
    var body: some View{
        Color(.gray)
            .edgesIgnoringSafeArea(.all)
            .opacity(0.5)
        
        VStack{
            Image(systemName: "\(image)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
            Text("\(answer)")
                .font(.system(size: 25))
                .bold()
                .padding(.bottom, 5)

            
            Text("Being called by unknown number is one of the social engineering technique.")
                .bold()
                .multilineTextAlignment(.center)
                .padding(.bottom, 5)
            
            Text("Based on that speech, the person is trying to get your personal information. You should never give your personal information to stranger.")
                .bold()
                .multilineTextAlignment(.center)
                .padding(.bottom, 5)
            
            Text("So you should hang up the phone !")
                .bold()
                .multilineTextAlignment(.center)
                .padding(.bottom, 5)
            
            Text("UNDERSTAND")
                .foregroundColor(.white)
                .bold()
                .font(.system(size: 18))
                .frame(width: 200)
                .padding(.trailing, 10)
                .padding([.top, .bottom])
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.white, lineWidth: 8)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                    
                )
                .background(Color("MediumBlue"))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .onTapGesture {
                    popUp = false
                    withAnimation{
                        nextPage.toggle()
                    }
                }
        }
        .frame(width: 300)
    //            .padding(.top, 20)
    //            .padding(.bottom, 20)
        .padding(20)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.white, lineWidth: 10)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            
        )
        .background(Color("MediumGray"))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
