

import SwiftUI

struct TheTextView: View {
    @State var host_port : Int
    @State var textData : SwoopyView
    var body: some View {
        Text("\(textData.text!)")
            .foregroundColor(getColorFromString(colorName: textData.fgcolor!))
            .onHover {d in
                ClientSideUpdateReq(hostPort: host_port, update_name: "on_view_action", update_content: [
                    "action_name" : "on_hover",
                    "view_id" : textData.view_id,
                    "hover_state" : "\(d)"
                ])
            }
    }
}
