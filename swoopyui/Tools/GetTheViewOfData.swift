import SwiftUI


func GetTheDataView (swoopyuiViewData:SwoopyView, hostPort:Int) -> AnyView {
    if swoopyuiViewData.vname == "Text" {
        return AnyView(TheTextView(host_port: hostPort, textData: swoopyuiViewData))
    }else if swoopyuiViewData.vname == "Button" {
        return AnyView(TheButtonView(host_port: hostPort, textData: swoopyuiViewData))
    }else if swoopyuiViewData.vname == "NavigationView" {
        return AnyView (TheNavigationView(host_port: hostPort, textData: swoopyuiViewData))
    }else if swoopyuiViewData.vname == "NavigationStack" {
        return AnyView (TheNavigationStack(host_port: hostPort, textData: swoopyuiViewData))
    }else if swoopyuiViewData.vname == "NavigationLink" {
        return AnyView (TheNavigationLink(host_port: hostPort, textData: swoopyuiViewData))
    }else if swoopyuiViewData.vname == "TextField" {
        return AnyView (TheTextField(host_port: hostPort, textData: swoopyuiViewData))
    }else if swoopyuiViewData.vname == "Stack" {
        return AnyView (TheStackView(host_port: hostPort, textData: swoopyuiViewData))
    }else if swoopyuiViewData.vname == "ScrollView" {
        return AnyView (TheScrollView(host_port: hostPort, textData: swoopyuiViewData))
    }
    
    
    return AnyView(Text("Unknown View!"))
}
