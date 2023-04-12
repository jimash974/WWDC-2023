//
//  testing.swift
//  I-Aware
//
//  Created by Jeremy Christopher on 12/04/23.
//

import SwiftUI

struct testing: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 48)
                    .padding(.trailing, 15)
                
                VStack(alignment: .leading){
                    Text("Packet Courier")
                        .bold()
//                        .multilineTextAlignment(.center)
                    
                    Text("Online")
                    
                    Text("Hello, World!")
                        .multilineTextAlignment(.leading)
                }
                
                Spacer()
                
                Image(systemName: "phone.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20)
                    .padding(.trailing, 15)
            }
            .padding(10)
        .background(Color.gray)
            
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
                
//                Spacer()
                
                Image(systemName: "phone.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20)
                    .padding(.trailing, 15)
            }
            .padding(10)
        .background(Color.gray)
        
        Spacer()
        Spacer()
    }
    }
}

struct testing_Previews: PreviewProvider {
    static var previews: some View {
        testing()
    }
}
