//
//  ScoreView.swift
//  I-Aware
//
//  Created by Jeremy Christopher on 16/04/23.
//

import SwiftUI

struct ScoreView: View {
    @Binding var score: Int
    @State var opacity = 0.0


    var body: some View {
        NavigationView{
            ZStack{
                Color(red: 103/255, green: 200/255, blue: 255/255)
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    HStack{
                        Spacer()
                 
                        NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true)) {
//                            Text("Go to Detail View")
                            Image(systemName: "house.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50)
                                .foregroundColor(.black)
                                .padding(.top, 20)
        //                        .background(Color("MediumGray"))
        //                        .cornerRadius(10)
                        }
                    }
                    .padding(.trailing, 20)
                    Text("YOUR\nSECURITY\nAWARENESS\nIS\n")
                        .foregroundColor(.white)
                        .bold()
                        .font(.system(size: 60))
    //                    .padding(.top, 10)
                        .opacity(opacity)
                        .animation(Animation.easeInOut(duration: 1).delay(1))
                        .onAppear {
                            withAnimation{
                                opacity = 1.0
                            }
                        }
                    
                    HStack{
                        Spacer()
                        if score == 3{
                            Text("HIGH")
                                .bold()
                                .font(.system(size: 80))
                                .foregroundColor(.green)
                                .opacity(opacity)
                                .animation(Animation.easeInOut(duration: 1).delay(3))
                                .onAppear {
                                    withAnimation{
                                        opacity = 1.0
                                    }
                                }
                        }
                        else if score == 2{
                            Text("MEDIUM")
                                .bold()
                                .font(.system(size: 80))
                                .foregroundColor(.yellow)
                                .opacity(opacity)
                                .animation(Animation.easeInOut(duration: 1).delay(1))
                                .onAppear {
                                    withAnimation{
                                        opacity = 1.0
                                    }
                                }
                        }
                        else if score < 2{
                            Text("LOW")
                                .bold()
                                .font(.system(size: 80))
                                .foregroundColor(.red)
                                .opacity(opacity)
                                .animation(Animation.easeInOut(duration: 1).delay(1))
                                .onAppear {
                                    withAnimation{
                                        opacity = 1.0
                                    }
                                }
                        }

                        Spacer()
                    }
                    .padding(10)
                    .background(.white)
                    .padding(.bottom, 50)
                    Spacer()
                }

            }
        }.navigationViewStyle(.stack)
    }
}

//struct ScoreView_Previews: PreviewProvider {
//    static var previews: some View {
//        ScoreView()
//    }
//}
