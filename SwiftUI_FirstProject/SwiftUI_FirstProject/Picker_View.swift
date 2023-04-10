import SwiftUI

struct Picker_View: View {
    @State var isOnToggle = false
    @State var procentSection = 0
    @State var section = 0
    
    var settingsTimeArray = ["5 min", "10 min", "15 min"]
    var procentArray = ["3%", "66%", "99%"]
    
    var body: some View {
        showPicker()
    }
    
    fileprivate func showPicker() -> some View {
        NavigationView {
            Form {
                VStack {
                    Picker(selection: $section, label: Text("Time"), content: {
                        ForEach(0..<settingsTimeArray.count) {
                            Text(self.settingsTimeArray[$0])
                        }
                    })
                    Text("Chosen time: \(settingsTimeArray[section])")
                }
                
                Toggle(isOn: $isOnToggle) {
                    Text("Airplane Mode").foregroundColor(isOnToggle ? .orange : .gray)
                }
                
                Picker(selection: $procentSection, label: Text("Lite"), content: {
                    ForEach(0..<procentArray.count) {
                        Text(self.procentArray[$0])
                    }
                }).pickerStyle(.segmented)
            }.navigationTitle("Settings")
        }
    }
}

struct Picker_Previews: PreviewProvider {
    static var previews: some View {
        Picker_View()
    }
}
