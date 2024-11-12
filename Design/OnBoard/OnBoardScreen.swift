import SwiftUI

var totalPage = 4
//On board screen
struct OnBoardScreen: View {
    @AppStorage("currentPage") var currentPage = 1
    var body: some View {
        NavigationStack {
            ZStack{
                Color(AppColors.whiteColor).edgesIgnoringSafeArea(.all)
                if currentPage == 1 {
                    ScreenView(currentPage: currentPage, image: "1", title: "Welcome in Design!!", details: "We’re here to make managing your health easy. Find doctors, learn about hospitals, and book appointments—all in one place.")
                }
                if currentPage == 2 {
                    ScreenView(currentPage: currentPage, image: "2", title: "Why this App!!", details: "Design helps you quickly find the right doctors in our hospital. With just a few taps, you can get all the information you need and book appointments fast.")
                }
                if currentPage == 3 {
                    ScreenView(currentPage: currentPage, image: "3", title: "Our Aim!!", details: "With Design, you can easily check hospital services, find specialists, and book your appointments. Everything is made simple for you.")
                }
                if currentPage == 4 {
                    ScreenView(currentPage: currentPage, image: "4", title: "Our Mission!!", details: "Take control of your health! With Design, we’re here to make your healthcare journey smooth, stress-free And keep your data careflly")
                }
            }
        }
    }
}

struct ScreenView: View {
    @AppStorage("currentPage") var currentPage = 1
    var image: String
    var title: String
    var details: String
    //@State var currentPage: Int
    var body: some View {
        VStack{
            HStack{
                if currentPage == 1 {
                    Text("Hello !")
                        .font(.title)
                        .fontWeight(.semibold)
                        .kerning(1.4)
                } else {
                    Button(action: {
                        currentPage -= 1
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(AppColors.whiteColor)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(AppColors.primaryColor)
                            .cornerRadius(10)
                    })
                }
                Spacer()
                Button(action: {
                    currentPage = 5
                }, label: {
                    Text("Skip")
                        .fontWeight(.semibold)
                        .kerning(1.2)
                        .foregroundColor(AppColors.primaryColor)
                })
            }.padding()
                .foregroundColor(.black)
            
            Spacer(minLength: 0)
            
            Image(image)
                .resizable()
                .cornerRadius(15)
                //.aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .padding(.horizontal, 16)
                .frame(height: 250)
                .cornerRadius(15)
            
            Spacer(minLength: 80)
            Text(title)
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .kerning(1.2)
                .padding(.top)
                .padding(.bottom, 5)
                .foregroundColor(Color(AppColors.primaryColor))
            
            Text(details)
                .font(.system(size: 16))
                .fontWeight(.regular)
                .kerning(1.2)
                .padding([.leading, .trailing])
                .multilineTextAlignment(.center)
            
            Spacer(minLength: 0)
            
            HStack{
                if currentPage == 1  {
                    Color(AppColors.primaryColor)
                        .frame(height: 8/UIScreen.main.scale)
                    Color(AppColors.secondaryColor)
                        .frame(height: 3/UIScreen.main.scale)
                    Color(AppColors.secondaryColor)
                        .frame(height: 3/UIScreen.main.scale)
                    Color(AppColors.secondaryColor)
                        .frame(height: 3/UIScreen.main.scale)
                }
                if currentPage == 2  {
                    Color(AppColors.secondaryColor)
                        .frame(height: 3/UIScreen.main.scale)
                    Color(AppColors.primaryColor)
                        .frame(height: 8/UIScreen.main.scale)
                    Color(AppColors.secondaryColor)
                        .frame(height: 3/UIScreen.main.scale)
                    Color(AppColors.secondaryColor)
                        .frame(height: 3/UIScreen.main.scale)
                }
                if currentPage == 3  {
                    Color(AppColors.secondaryColor)
                        .frame(height: 3/UIScreen.main.scale)
                    Color(AppColors.secondaryColor)
                        .frame(height: 3/UIScreen.main.scale)
                    Color(AppColors.primaryColor)
                        .frame(height: 8/UIScreen.main.scale)
                    Color(AppColors.secondaryColor)
                        .frame(height: 3/UIScreen.main.scale)
                }
                
                if currentPage == 4  {
                    Color(AppColors.secondaryColor)
                        .frame(height: 3/UIScreen.main.scale)
                    Color(AppColors.secondaryColor)
                        .frame(height: 3/UIScreen.main.scale)
                    Color(AppColors.secondaryColor)
                        .frame(height: 3/UIScreen.main.scale)
                    Color(AppColors.primaryColor)
                        .frame(height: 8/UIScreen.main.scale)
                }
                
                
            }.padding([.leading, .trailing], 16)
            
            Button(action: {
                if currentPage <= totalPage {
                    currentPage += 1
                    @AppStorage("currentPage") var currentPage = currentPage
                } else {
                    currentPage = 1
                }
            }, label: {
                Text("Next")
                    .fontWeight(.semibold)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(.all, 10)
                    .foregroundColor(.white)
                    .background(Color(AppColors.primaryColor))
                    .cornerRadius(40)
                    .padding(.horizontal, 16)
            })
        }
    }
}
