//
//  ChatView.swift
//  I-Aware
//
//  Created by Jeremy Christopher on 11/04/23.
//

import SwiftUI

struct ChatView: View {
    @State private var popUp = false
    
    var body: some View {
        ZStack{
            Color("MediumBlue")
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0){
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
//                .edgesIgnoringSafeArea(.all)
                
//                .background(.gray)
                
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
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.white, lineWidth: 0)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                
                            )
                            .background(Color("MediumGray"))
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                        
                        Spacer()
                    }
//                    .padding(20)
//                    .background(Color.white)
                    
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
//                    .padding(20)
//                    .background(Color.white)
                    
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
//                    .padding(20)
//                    .padding(.bottom, 100)
//                    .background(Color.white)
                }
                .padding(20)
                .padding(.bottom, 100)
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
                                .onTapGesture {
                                    popUp = true
                                }
                            Text("to check the package")
                                .font(.system(size: 12))
                                .bold()
                                .onTapGesture {
                                    popUp = true
                                }
                        }
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.white, lineWidth: 8)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                            
                        )
                        .background(Color("MediumGray"))
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        
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
                    }
                }
                .padding()
                .padding(.top, 20)
                Spacer()
            }
            
            if popUp{
                PopUpView(popUp: $popUp)
            }
            
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}

struct PopUpView: View{
    @Binding var popUp: Bool
    var body: some View{
        Color(.gray)
            .edgesIgnoringSafeArea(.all)
            .opacity(0.5)
        
        VStack{
            Image(systemName: "checkmark.seal.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
            Text("CORRECT !")
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
