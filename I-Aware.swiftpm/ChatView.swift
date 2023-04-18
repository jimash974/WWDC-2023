//
//  ChatView.swift
//  I-Aware
//
//  Created by Jeremy Christopher on 11/04/23.
//

import SwiftUI

struct ChatView: View {
    @State private var popUp = false
    @State private var answer = ""
    @State private var image = ""
    @State private var score = 0
    @State private var nextPage = false
    @State var scale = 0.0
    @State var padding = false



    
    var body: some View {
        ZStack{
            Color("MediumBlue")
                .edgesIgnoringSafeArea(.all)
            
            NavigationView{
                VStack(spacing: 0){
                    VStack{
                        HStack{
                            Image(systemName: "person.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 48)
                                .padding(.trailing, 15)

                            VStack(alignment: .leading){
                               Text("Packet Courier")
                                    .bold()
                                
                                Text("Online")
                            }
                            
                            Spacer()
                            
                            Image(systemName: "phone.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20)
                                .padding(.trailing, 15)
                        }
                        .padding(10)
                        .background(Color("MediumGray"))
                        
                        VStack(spacing: 30){
                                HStack{
                                    Image(systemName: "person.circle")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30)
                                    Text("Good morning, i'm from FeedAx courier just want to give you an information that your package has been arrived in your house")
                                        .bold()
                                        .font(.system(size: 14))
                                        .frame(width: 200)
                                        .padding(10)
                                        .background(Color("MediumGray"))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 16)
                                                .stroke(Color.white, lineWidth: 0)
                                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                            
                                        )
                                        .clipShape(RoundedRectangle(cornerRadius: 16))
//                                        .padding(.bottom, padding ? 8 : 0)
                                    Spacer()
                                }
                                .opacity(scale)
                                .animation(Animation.easeInOut(duration: 1).delay(1))
                                .onAppear {
                                    withAnimation{
                                        scale = 1.0
//                                        padding = true
                                    }
                                }
                            
                            HStack{
                                Image(systemName: "person.circle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30)
                                Text("Here is the picture of the package ....")
                                    .bold()
                                    .font(.system(size: 14))
                                    .frame(width: 200)
                                    .padding(.trailing, 10)
                                    .padding([.top, .bottom])
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(Color.white, lineWidth: 0)
                                            .clipShape(RoundedRectangle(cornerRadius: 16))
                                        
                                    )
                                    .background(Color("MediumGray"))
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                
                                Spacer()
                            }
                            .opacity(scale)
                            .animation(Animation.easeInOut(duration: 1).delay(2))
                            .onAppear {
                                withAnimation{
                                    scale = 1.0
//                                        padding = true
                                }
                            }
                            
                            HStack{
                                Image(systemName: "person.circle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30)
                                HStack {
                                    Image(systemName: "doc.fill")
                                    
                                    Text("image.ipa")
                                        .bold()
                                        .font(.system(size: 14))
                                }
                                .padding()
                                .background(Color("MediumGray"))
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                                
                                Spacer()
                            }
                            .opacity(scale)
                            .animation(Animation.easeInOut(duration: 1).delay(3))
                            .onAppear {
                                withAnimation{
                                    scale = 1.0
//                                        padding = true
                                }
                            }
                        }
                        .padding()
                        
                        Spacer()
                    }
    //                .padding(.bottom, 100)
                    .frame(height: 500)
                    .background(Color.white)
                    
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
                                Text("Open the image")
                                    .font(.system(size: 18))
                                    .bold()
                                Text("to check the package")
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
                            
                            VStack(){
                                Text("Ignore the message")
                                    .font(.system(size: 18))
                                    .bold()
                                Text("by not check the image")
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
                        }
                    }
                    .opacity(scale)
                    .animation(Animation.easeInOut(duration: 1).delay(5))
                    .onAppear {
                        withAnimation{
                            scale = 1.0
                        }
                    }
                    .padding()
                    .padding(.top, 20)
                    Spacer()
                }
                .background(Color("MediumBlue"))
            }
            
            if popUp{
                ChatPopUpView(popUp: $popUp, answer: $answer, image: $image, nextPage: $nextPage)
            }
            if nextPage{
                CallView(score: $score)
//                    .transition(.move(edge: .trailing))
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}

struct ChatPopUpView: View{
    @Binding var popUp: Bool
    @Binding var answer: String
    @Binding var image: String
    @Binding var nextPage: Bool


    
    var body: some View{
        ZStack{
            Color(.gray)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.5)
            
            ZStack{
                VStack{
                    Image(systemName: "\(image)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100)
                    Text("\(answer)")
                        .font(.system(size: 25))
                        .bold()
                        .padding(.bottom, 5)
                    
                    
                    Text("Common image extension\n are .jpg, .png, .jpeg, etc.")
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 5)
                    
                    Text("Based on that chat, the courier send you an image with .ipa.")
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 5)
                    
                    Text(".ipa is an extension for ios app, that indicate the person is trying to install an app in your iphone.")
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 5)
                    
                    Text("So you should ignore the message !")
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
    }
}
