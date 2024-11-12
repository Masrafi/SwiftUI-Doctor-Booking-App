import SwiftUI

struct Profile: View {
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack {
                    ProfilePic()
                    Divider()
                    HStack {
                        NavigationLink(destination: DoctorCart().navigationBarBackButtonHidden(true) ) {
                            CartOption(title: "Doctor cart")
                        }
                        NavigationLink(destination: BookingCart().navigationBarBackButtonHidden(true) ) {
                            CartOption(title: "Booking history")
                        }
                    }
                    HStack {
                        NavigationLink(destination: TestCart().navigationBarBackButtonHidden(true) ) {
                            CartOption(title: "Test cart")
                        }
                        NavigationLink(destination: TestHistoryCart().navigationBarBackButtonHidden(true) ) {
                            CartOption(title: "Test history")
                        }
                    }
                    CartOption(title: "Edit profile")
                    NavigationLink(destination: Login().navigationBarBackButtonHidden(true) ) {
                        LogOInButton(title: "Log In")
                    }
                    PrivacyTerms(title: "Privacy Policy")
                    PrivacyTerms(title: "Terms & Condition")
                    LogOutButton(title: "Log Out")
                        .padding(.bottom, 50)
                    Spacer()
                } 
            }
        }
    }
}

#Preview {
    Profile()
}
struct ProfilePic: View {
    var body: some View {
            VStack(alignment: .leading){
                HStack{
                    ZStack{
                        HStack{
                            HStack{
                                Image("masrafi").resizable().font(.system(size: 15)).foregroundColor(Color(AppColors.primaryColor)).frame(width: 80,height: 80).background(AppColors.whiteColor).cornerRadius(50)
                            }.frame(width: 100,height: 100).background(Color(AppColors.whiteColor)).cornerRadius(79)
                            
                        }.frame(width: 110,height: 110).background(Color(AppColors.secondaryColor)).cornerRadius(79).padding(EdgeInsets(top: 0, leading: 15, bottom: 10, trailing: 5))
                        Image(systemName: "camera").font(.system(size: 14)).fontWeight(.bold
                        ).foregroundColor(Color(AppColors.primaryColor)).frame(width: 50,height: 25).background(AppColors.whiteColor).cornerRadius(20).shadow(color: Color.black.opacity(0.3), radius: 3, x: 0, y: 0).padding(.top, 110)
                    }
                    VStack(alignment: .leading){
                        Text("Masrafi Anam").font(.system(size: 16)).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Text("Mobile Application Engineer").font(.system(size: 14)).fontWeight(.medium).foregroundColor(Color(AppColors.unFocusColor))
                    }
                    Spacer()
                }
                
            }.frame(maxWidth:  .infinity )  // Set specific width and height
                .background(Color(AppColors.whiteColor)).padding(.top, 1)
            
       
    }
}

struct CartOption: View {
    var title: String
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                Image(systemName: "clock")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .leading)
                    .foregroundColor(AppColors.blackColor)
                Text(title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(AppColors.blackColor)
            }
            Spacer()
        }
        .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
        .frame(maxWidth: .infinity)
        .background(Color(AppColors.whiteColor))
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.3), radius: 3, x: 0, y: 0)
        .padding([.leading, .top, .trailing], 15)
    }
}
struct LogOutButton: View {
    var title: String
    @State var showingPopup = false
    var body: some View {
        Button(action: {
                           showingPopup = true
                       }) {
        HStack{
                
                Text(title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(AppColors.blackColor)
            Spacer()
            Image(systemName: "chevron.forward")
                .resizable()
                .frame(width: 15, height: 20, alignment: .leading)
                .foregroundColor(AppColors.blackColor)
            
        }
        .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
        .frame(maxWidth: .infinity)
        .background(Color(AppColors.whiteColor))
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.3), radius: 3, x: 0, y: 0)
        .padding([.leading, .top, .trailing], 15)
        }
        .alert(isPresented: $showingPopup){
               Alert(title: Text("Log out"), message: Text("Are you sure?"), primaryButton: .destructive(Text("Yes")){
                   print("Log out successfully")
               },
                     secondaryButton: .cancel()
               )
           }
    }
}


struct LogOInButton: View {
    var title: String
    var body: some View {
        HStack{
            
            Text(title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(AppColors.blackColor)
            Spacer()
            Image(systemName: "chevron.forward")
                .resizable()
                .frame(width: 15, height: 20, alignment: .leading)
                .foregroundColor(AppColors.blackColor)
            
        }
        .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
        .frame(maxWidth: .infinity)
        .background(Color(AppColors.whiteColor))
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.3), radius: 3, x: 0, y: 0)
        .padding([.leading, .top, .trailing], 15)
    }
}

struct PrivacyTerms: View {
    var title: String
    @State var showingPopup = false
    var body: some View {
        
            HStack{
                
                Text(title)
                    .fontWeight(.bold)
                    .foregroundColor(AppColors.blackColor)
                Spacer()
                Image(systemName: "chevron.forward")
                    .resizable()
                    .frame(width: 15, height: 20, alignment: .leading)
                    .foregroundColor(AppColors.blackColor)
                
            }
            .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
            .frame(maxWidth: .infinity)
            .background(Color(AppColors.whiteColor))
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.3), radius: 3, x: 0, y: 0)
            .padding([.leading, .top, .trailing], 15)
       
        
    }
}
