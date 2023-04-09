import SwiftUI

struct ContentView: View {
    @State var isError = false
    @State var isOnToggle = false
    
    var body: some View {
//        Choose functions:
//        showAlert()
//        showActionSheet()
        showToggle()
    }
    
    fileprivate func showAlert() -> some View {
        Button(action: {
            self.isError = true
        }, label: {
            Text("Log in")
        }).alert(isPresented: $isError, content: {
            Alert(title: Text("Title"),
                  message: Text("Are you sure?"),
                  primaryButton: .destructive(Text("Ok"),
                                              action: {
                                                print("Zapka market")
                  }), secondaryButton: .cancel())
        })
    }
    
    fileprivate func showActionSheet() -> some View {
        Button(action: {
            self.isError = true
        }, label: {
            Text("Log out")
        }).actionSheet(isPresented: $isError, content: {
            ActionSheet(title: Text("Loading"),
                        message: Text("Do you want to load this photo?"),
                        buttons: [.destructive(Text("Yes"), action: {
                            // func for loading
                        }), .cancel()])
        })
    }
    
    fileprivate func showToggle() -> some View {
        VStack {
            ZStack {
                HStack {
                    VStack {
                        Text("Visa")
                        Text("Cash")
                        Spacer().frame(height: 300)
                    }
                    Spacer()
                }
                RoundedRectangle(cornerRadius: 10).fill(Color.yellow).offset(x: isOnToggle ? 100 : 0)
                Text("Smth on the screan").offset(x: isOnToggle ? 100 : 0)
            }
            Toggle(isOn: $isOnToggle, label: {
                Text("Показать текста")
            }).padding()
        }.animation(.spring(response: 0.5,
                            dampingFraction: 0.7,
                            blendDuration: 0.3))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
