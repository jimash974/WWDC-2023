import SwiftUI

struct ContentView: View {
    var body: some View {

        ZStack{
            Color("MediumBlue")
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 420)
                
                
                Text("Play !")
                    .font(.custom("SF Compact Rounded", size: 68))
                    .foregroundColor(.white)
                
//                Spacer()
                

                VStack{
                    Image(systemName: "play")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50)
                }
                .frame(width: 250, height: 125)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.white, lineWidth: 15)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                    
                )
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.top, 50)


                    
                
                Spacer()
            }
        }
        
//        VStack {
//            Spacer()
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//
//            Image("Logo")
//                .resizable()
//                .frame(width: 200, height: 200)
//            Text("Hello, world!")
//            Spacer()
//        }
//        .background()
    }
}
