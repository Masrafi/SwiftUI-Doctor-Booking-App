import SwiftUI

struct BottomBar: View {
    @State var currentTab: Tab1 = .Home
    
    //Hide Native Bar
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    //Matched Geometry offect
    @Namespace var animation
    var body: some View {
        TabView(selection: $currentTab) {
            Home()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("bottomColor").ignoresSafeArea())
                .tag(Tab1.Home)
            Doctor()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("bottomColor").ignoresSafeArea())
                .tag(Tab1.Search)
            Notification()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("bottomColor").ignoresSafeArea())
                .tag(Tab1.Notification)
//            Cart()
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                .background(Color("bottomColor").ignoresSafeArea())
//                .tag(Tab1.Cart)
            Profile()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("bottomColor").ignoresSafeArea())
                .tag(Tab1.Profile)
        }
        .overlay(
            HStack(spacing: 0){
                ForEach(Tab1.allCases, id: \.rawValue) { tab in
                    TabButton(tab1: tab)
                }
                .padding(.vertical)
                .padding(.bottom, getSafeArea().bottom == 0 ? 5 : (getSafeArea().bottom - 15))
                .background(AppColors.secondaryColor)
            }
                ,alignment: .bottom
        ).ignoresSafeArea(.all, edges: .bottom)
    }
    func TabButton(tab1: Tab1) -> some View {
        GeometryReader {proxy in
            Button(action: {
                withAnimation(.spring()) {
                    currentTab = tab1
                }
            }, label: {
                VStack(spacing: 0) {
                    Image(systemName: currentTab == tab1 ? tab1.rawValue + ".fill" : tab1.rawValue)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(AppColors.whiteColor)
                    Text(tab1.tabName)
                        .font(.system(size: currentTab == tab1 ? 14 : 12))
                        .foregroundColor(AppColors.whiteColor)
                        .fontWeight(currentTab == tab1 ? .bold : .light)
//                        .background(
//                            ZStack{
//                                if currentTab == tab1 {
//                                    MaterialEffect(style: .light)
//                                        .clipShape(Circle())
//                                        .matchedGeometryEffect(id: "TAB", in: animation)
//
//                                    Text(tab1.tabName)
//                                        .foregroundColor(.primary)
//                                        .font(.footnote)
//                                        .padding(.top, 50)
//                                }
//                            }
//                        ).contentShape(Rectangle())
//                        .offset(y: currentTab == tab1 ? -35 : 0)
                }
            })
        }
        .frame(height: 25)
    }
}

#Preview {
    BottomBar()
}

//Tabbar enum
enum Tab1: String, CaseIterable {
    case Home = "house"
    case Search = "magnifyingglass.circle"
    case Notification = "bell"
    //case Cart = "bag"
    case Profile = "person"
    
    var tabName: String {
        switch self {
        case .Home:
            return "Home"
        case .Search:
            return "Doctors"
        case .Notification:
            return "Notification"
//        case .Cart:
//            return "Cart"
        case .Profile:
            return "Profile"
        }
    }
}

//Safe Area
extension View {
    func getSafeArea() -> UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first
                as? UIWindowScene else {
            return .zero
        }
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        return safeArea
    }
}

struct MaterialEffect: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        
        return view
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
       
    }
}
