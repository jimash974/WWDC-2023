import SwiftUI

struct ContentView: View {
    var body: some View {

        NavigationView{
            ZStack{
                Color(red: 103/255, green: 200/255, blue: 255/255)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0){
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 620)
                    
                    Text("Play !")
                        .font(.custom("SF Compact Rounded", size: 68))
                        .foregroundColor(.white)
                        .padding(.top, -30)
                                        
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
                        .padding(.top, 30)
                    }
                    Spacer()
                }
                .padding(.top, 50)
            }
        }.navigationViewStyle(.stack)
    }
}

