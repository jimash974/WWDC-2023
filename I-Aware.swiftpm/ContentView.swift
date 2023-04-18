import SwiftUI

struct ContentView: View {
    var body: some View {

        NavigationView{
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
                    
                    NavigationLink(destination: ChatView().navigationBarBackButtonHidden(true)) {
                        VStack{
                            Image(systemName: "play")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50)
                                .foregroundColor(.black)
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
                    }
                    Spacer()
                }
            }
        }.navigationViewStyle(.stack)
        
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
