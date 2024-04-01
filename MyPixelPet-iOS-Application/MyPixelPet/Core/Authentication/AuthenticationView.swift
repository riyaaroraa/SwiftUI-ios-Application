import SwiftUI

struct AuthenticationView: View {
    
    @Binding var showSignInView: Bool
    
    var body: some View {
        ZStack { // Use ZStack
            // Background image
            Image("PixelPet1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .padding(.leading, 0)
            
            VStack {
                NavigationLink {
                    SignInEmailView(showSignInView: $showSignInView)
                } label: {
                    Text("Sign In With Email")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.pink)
                        .padding(.top, 700)
                        .cornerRadius(50)
                }
            }
            .padding()
            // Text view for "Welcome! Sign In"
            ZStack {
                Color.clear // Use clear color to make the ZStack transparent
                Text("Welcome! Sign In")
                    .font(.title)
                    .bold()
                    .foregroundColor(.black)
                    .padding(.top, 20)
            }
            .offset(y: -300) // Adjust vertical
        }
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AuthenticationView(showSignInView: .constant(false))
        }
    }
}

