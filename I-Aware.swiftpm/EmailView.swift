//
//  EmailView.swift
//  I-Aware
//
//  Created by Jeremy Christopher on 15/04/23.
//

import SwiftUI

struct EmailView: View {
    @State private var popUp = false
    @State private var answer = ""
    @State private var image = ""
    @State private var nextPage = false
    @Binding var score: Int
    @State var opacity = 0.0
    @State private var show = false


    
    var body: some View {
        ZStack{
            Color(red: 103/255, green: 200/255, blue: 255/255)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0){
                VStack{
                    HStack{
                        Spacer()
                        Text("Your account has been blocked")
                            .bold()
                            .font(.system(size: 25))
                            .padding(.top, 50)
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .opacity(opacity)
                    .animation(Animation.easeInOut(duration: 1).delay(1))
                    .onAppear {
                        withAnimation{
                            opacity = 1.0
//                                        padding = true
                        }
                    }
                    
                    VStack{
                        HStack{
                        Image(systemName: "person.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 28)
                        
                        VStack(alignment: .leading){
                            HStack{
                                Text("CBA")
                                    .bold()
                                Text("<<cba@mail.com>>")
                                    .foregroundColor(.black)
                                    .colorScheme(.light)
                            }
                            Text("to me")
                        }
                        Spacer()
                        }
                        .frame(width: 350)
                        .padding(.leading, 20)
                    }
                    .opacity(opacity)
                    .animation(Animation.easeInOut(duration: 1).delay(2))
                    .onAppear {
                        withAnimation{
                            opacity = 1.0
//                                        padding = true
                        }
                    }
                    
                    HorizontalLine()
                        .stroke(Color.gray, lineWidth: 1)
                        .frame(width: 380 ,height: 1)
                        .opacity(opacity)
                        .animation(Animation.easeInOut(duration: 1).delay(2))
                        .onAppear {
                            withAnimation{
                                opacity = 1.0
    //                                        padding = true
                            }
                        }
                    
                    VStack(alignment: .leading){
                        Text("Dear Customer\nYour account has just been blocked due to recent activity of unregistered user.")
                            .padding(.bottom, 30)
                            .foregroundColor(.black)


                        Text("Click the link below to recover your account :")
                        Text("click here")
                            .bold()
                            .foregroundColor(.blue)
                            .underline()
                            .padding(.bottom, 100)
                        
                        Text("Thank you,\n CBA IT Support")
                            .foregroundColor(.black)
                        
                    }
                    .frame(width: 350)
                    .opacity(opacity)
                    .animation(Animation.easeInOut(duration: 1).delay(3))
                    .onAppear {
                        withAnimation{
                            opacity = 1.0
//                                        padding = true
                        }
                    }
                    
                    Spacer()
                }
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
                        .background(Color(red: 226/255, green: 222/255, blue: 222/255))
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .opacity(opacity)
                        .animation(Animation.easeInOut(duration: 1).delay(5))
                    
                    if show{
                        HStack{
                            VStack(){
                                Text("Click the link")
                                    .font(.system(size: 18))
                                    .bold()
                                Text("to recover your account")
                                    .font(.system(size: 12))
                                    .bold()
                            }
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.white, lineWidth: 8)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                
                            )
                            .background(Color(red: 226/255, green: 222/255, blue: 222/255))
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .onTapGesture {
                                popUp = true
                                answer = "INCORRECT"
                                image = "x.circle.fill"
                            }
                            
                            VStack(){
                                Text("Block the sender ")
                                    .font(.system(size: 18))
                                    .bold()
                                Text("to stop receiving email")
                                    .font(.system(size: 12))
                                    .bold()
                            }
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.white, lineWidth: 8)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                
                            )
                            .background(Color(red: 226/255, green: 222/255, blue: 222/255))
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .onTapGesture {
                                popUp = true
                                answer = "CORRECT"
                                image = "checkmark.seal.fill"
                                score = score + 1
                            }
                        }
                        .animation(Animation.easeInOut(duration: 1))
                    }
                }
                .onAppear {
                    withAnimation{
                        opacity = 1.0
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 6.0, execute: {
                        withAnimation{
                            show = true
                        }
                    })
                }
                .padding()
                .padding(.top, 20)
                Spacer()
            }
            
            if popUp{
                EmailPopUpView(popUp: $popUp, answer: $answer, image: $image, nextPage: $nextPage)
            }
            if nextPage{
                ScoreView(score: $score)
                    .transition(.move(edge: .trailing))
            }
        }
    }
}

//struct EmailView_Previews: PreviewProvider {
//    static var previews: some View {
//        EmailView()
//    }
//}


struct HorizontalLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        return path
    }
}

struct EmailPopUpView: View{
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

            
            Text("Bank email barely ended with mail.com(free domain), so this is a fake email that has link that probably a link phising that lead to malicious website.")
                .bold()
                .multilineTextAlignment(.center)
                .padding(.bottom, 5)
            
            Text("You have to make sure that every email you receive is came from legitimate sender.")
                .bold()
                .multilineTextAlignment(.center)
                .padding(.bottom, 5)
            
            Text("So in this case you should block the sender !")
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
                .background(Color(red: 103/255, green: 200/255, blue: 255/255))
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
        .background(Color(red: 226/255, green: 222/255, blue: 222/255))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
