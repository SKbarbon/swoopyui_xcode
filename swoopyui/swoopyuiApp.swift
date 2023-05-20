import SwiftUI

@main
struct swoopyui: App {
    @Environment(\.scenePhase) var scenePhase
    @State var host_port = 55425
    @State var host_password = ""
    @State var start_app = false
    
    @State var connected : Bool = false
    var body: some Scene {
        WindowGroup {
            if start_app {
                ContentView(hostPort: host_port)
                    .onAppear() {
                        NSApplication.shared.activate(ignoringOtherApps: true)
                        submit_and_run_python_target_function()
                    }
                    .onDisappear {
                        tell_host_to_close()
                        NSApplication.shared.terminate(self)
                    }
            }
        }
        .onChange(of: scenePhase) { phase in
            if phase == .active {
                // Access command-line arguments
                let commandLineArguments = CommandLine.arguments
                // Process the arguments as needed
                processCommandLineArguments(commandLineArguments)
                start_app = true
            }
        }
    }
    
    func processCommandLineArguments(_ arguments: [String]) {
        // The arguments must look like: ['./swoopyui', '<port>', '<password>']
        print(arguments)
        if arguments.contains("-NSDocumentRevisionsDebugMode"){}
        else{
            host_port = Int(arguments[1])!
//            host_password = String(arguments[2])
        }
    }
    
    func submit_and_run_python_target_function (){
        let url = URL(string: "http://127.0.0.1:\(host_port)/start_the_target_function")!

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                _ = String(data: data, encoding: String.Encoding.utf8) as String?
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }

        task.resume()
    }
    func tell_host_to_close (){
        let url = URL(string: "http://127.0.0.1:\(host_port)/close_the_app")!

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                _ = String(data: data, encoding: String.Encoding.utf8) as String?
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }

        task.resume()
    }
}
