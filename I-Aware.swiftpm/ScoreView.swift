//
//  ScoreView.swift
//  I-Aware
//
//  Created by Jeremy Christopher on 16/04/23.
//

import SwiftUI

struct ScoreView: View {
    @Binding var score: Int

    var body: some View {
        NavigationView{
            ZStack{
                Color("MediumBlue")
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
                    
                    HStack{
                        Spacer()
                        if score == 3{
                            Text("HIGH")
                                .bold()
                                .font(.system(size: 80))
                                .foregroundColor(.green)
                        }
                        else if score == 2{
                            Text("MEDIUM")
                                .bold()
                                .font(.system(size: 80))
                                .foregroundColor(.yellow)
                        }
                        else if score < 2{
                            Text("LOW")
                                .bold()
                                .font(.system(size: 80))
                                .foregroundColor(.red)
                        }

                        Spacer()
                    }
                    .padding(10)
                    .background(.white)
                    .padding(.bottom, 50)
                    

                    
                    Spacer()
                }
            }
        }
    }
}

//struct ScoreView_Previews: PreviewProvider {
//    static var previews: some View {
//        ScoreView()
//    }
//}
