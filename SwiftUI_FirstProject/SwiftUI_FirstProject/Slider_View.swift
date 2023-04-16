import SwiftUI
import AVFoundation

class PlayerViewModel: ObservableObject {
    @Published public var maxDuration = 0.0
    private var player: AVAudioPlayer?
    
    public func play() {
        playSound(name: "SaveThatShit")
        player?.play()
    }
    
    public func stop() {
        player?.stop()
    }
    
    public func setTime(value: Float ) {
        player?.currentTime = TimeInterval(value)
        player?.play()
    }
    
    private func playSound(name: String) {
        guard let audioPath = Bundle.main.path(forResource: name, ofType: "mp3") else { return }
        
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            maxDuration = player?.duration ?? 0.0
        }
        catch {
            print(error.localizedDescription)
        }
    }
}

struct Slider_View: View {
    @ObservedObject var viewModel = PlayerViewModel()
    
    @State private var progress: Float = 0
    
    var body: some View {
        VStack {
            Slider(value: Binding(get: {
                Double(self.progress)
            }, set: { newValue in
                self.progress = Float(newValue)
                self.viewModel.setTime(value: Float(newValue))
            }), in: 0...viewModel.maxDuration).padding().accentColor(.purple)
            
            HStack {
                Button(action: {
                    self.viewModel.play()
                }, label: {
                    Text("Play")
                        .foregroundColor(.white)
                })
                    .frame(width: 100, height: 50)
                    .background(Color.orange)
                    .cornerRadius(10)
                
                Button(action: {
                    self.viewModel.stop()
                }, label: {
                    Text("Stop")
                        .foregroundColor(.white)
                })
                    .frame(width: 100, height: 50)
                    .background(Color.orange)
                    .cornerRadius(10)
            }
        }
    }
}

struct Slider_View_Previews: PreviewProvider {
    static var previews: some View {
        Slider_View()
    }
}
