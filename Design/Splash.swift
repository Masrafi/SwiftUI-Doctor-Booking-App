import SwiftUI

struct SplashScreen: View{
    @AppStorage("currentPage") var currentPage = 1
    @State var isActive: Bool = false
    @State var showImg: Bool = false
    @State var showText: Bool = false
    @State var showText2: Bool = false
    
        var body: some View {
            ZStack {
                Color(AppColors.secondaryColor).edgesIgnoringSafeArea(.all)
                if self.isActive {
                    if currentPage > totalPage {
                        BottomBar()
                    }else {
                        OnBoardScreen()
                    }
                } else {
                    Image("splash").resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        .edgesIgnoringSafeArea(.all)
                        .opacity(showImg ? 1 : 0) // imp animation
                    VStack{
                        
                        
                        Text("Design")
                            .font(.system(size: 30))
                            .foregroundStyle(.white.gradient)
                            .opacity(showText ? 1 : 0) // imp animation
                        
                        Text("It is a doctor App")
                            .font(.system(size: 20))
                            .foregroundStyle(.white.gradient)
                            .padding(.horizontal)
                            .opacity(showText2 ? 1 : 0) // imp animation
                    }
                }
            }
            .onAppear {
                withAnimation(.smooth(duration:1).delay(0.5)) {
                    showImg.toggle()
                }// imp animation
                withAnimation(.smooth(duration:1.5).delay(1)) {
                    showText.toggle()
                }// imp animation
                withAnimation(.smooth(duration:2).delay(2)) {
                    showText2.toggle()
                }  // imp animation
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
}

