//
//  testing.swift
//  I-Aware
//
//  Created by Jeremy Christopher on 12/04/23.
//

import SwiftUI

struct testing: View {
    @State var scale = 0.0
    @State var padding = false

    var body: some View {
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
        }
    }
}

struct testing_Previews: PreviewProvider {
    static var previews: some View {
        testing()
    }
}
