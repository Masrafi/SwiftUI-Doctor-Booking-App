import SwiftUI

struct Login: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var text: String = ""
    @State private var pass: String = ""
    @State var showButtomSheet = false

    var body: some View {
        VStack{
            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrowshape.backward.fill")
                        .foregroundColor(Color(AppColors.whiteColor))
                    
                }
                Spacer()
                // }
                Text("Login")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(Color(AppColors.whiteColor))
//                    .frame(maxWidth: .infinity, alignment: .leading alignment: .).padding(.leading, 100) // Center align text
                Spacer()
            }.padding()
                .frame(maxWidth: .infinity, maxHeight: 60).background(Color(AppColors.primaryColor))
            
            
            Text("Welcome Back!").font(.system(size: 18)).fontWeight(.bold).foregroundColor(Color(AppColors.blackColor)).padding(.top,80).padding(.bottom,10)
            
            HStack {
                // Prefix Icon
                Image("email").padding(.trailing,5)
                
                // TextField
                TextField("Email address", text: $text)
                    
                    
                
                // Suffix Icon
                if !text.isEmpty {
                    Button(action: {
                        text = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                    }
                }}.padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15)).overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)) .padding(10)
            
            HStack {
                // Prefix Icon
                Image("password").padding(.trailing,5)
                
                // TextField
                TextField("Password", text: $pass)
                    
                    
                
                // Suffix Icon
                    Button(action: {
                        //text = ""
                    }) {
                        Image(systemName: "eye")
                            .foregroundColor(.gray)
                    }
                }.padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15)).overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)) .padding(10)
            Button(action: {
                showButtomSheet = true
            }) {
                HStack{
                    Spacer()
                    Text("Forgot Password?").font(.system(size: 16)).fontWeight(.bold)
                    
                }.padding(.trailing,15).sheet(isPresented: $showButtomSheet){
                    ForgorPass().presentationDetents([.height(300)])
                }
            }
            
            Text("Log In").font(.system(size: 16)).fontWeight(.bold).padding().foregroundColor(Color(AppColors.whiteColor)).frame(maxWidth: .infinity,maxHeight: 50).background(AppColors.secondaryColor).cornerRadius(10).padding()
            
            HStack{
                VStack{
                    
                }.frame(width:30, height: 1).background(Color(AppColors.unFocusColor))
                Text("Or Continue with").foregroundColor(Color(AppColors.unFocusColor))
                VStack{
                    
                }.frame(width:30, height: 1).background(Color(AppColors.unFocusColor))
            }
            HStack{
                Text("Don’t have an account?").font(.system(size: 14)).fontWeight(.bold).foregroundColor(Color(AppColors.primaryColor))
                NavigationLink(destination: Register().navigationBarBackButtonHidden(true) ) {
                    Text("Create Account.").font(.system(size: 14)).fontWeight(.bold).foregroundColor(Color(AppColors.secondaryColor))
                }
            }.padding(.top,10)
                
            Spacer()
        }.navigationBarHidden(true)
    }
}

#Preview {
    Login()
}
struct ForgorPassWord:View {
    @State private var text: String = ""
    @State var showButtomSheet = false

    var body: some View {
        VStack{
            HStack{
            }.frame(width: 100, height: 5).background(Color(AppColors.blackColor))
            
            VStack(alignment: .leading){
                Text("Forgot Password?").font(.system(size: 24)).fontWeight(.bold).foregroundColor(Color(AppColors.blackColor)).padding(EdgeInsets(top: 30, leading: 15, bottom: 10, trailing: 15))
                Text("Kindly provide your registered email address to reset your password and follow the instructions provided in the email.").font(.system(size: 14)).foregroundColor(Color(AppColors.blackColor)).padding(EdgeInsets(top: 0, leading: 15, bottom: 15, trailing: 15))
                
                HStack {
                    // Prefix Icon
                    Image("email").padding(.trailing,5)
                    
                    // TextField
                    TextField("Email address", text: $text)
                    
                    
                    
                    // Suffix Icon
                    if !text.isEmpty {
                        Button(action: {
                            text = ""
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                        }
                    }}.padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15)).overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)) .padding(15)
                HStack{
                    Spacer()
                    Button(action: {
                        showButtomSheet = true
                    }) {
                        Text("Continue").padding(EdgeInsets(top: 15, leading: 100, bottom: 15, trailing: 100)).font(.system(size: 16)).fontWeight(.bold)
                            .background(Color(AppColors.secondaryColor))
                            .foregroundColor(.white)
                            .cornerRadius(15).padding(.trailing,15).sheet(isPresented: $showButtomSheet){
                                PasswordReset().presentationDetents([.height(400)])
                            }
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
}


struct ResetPasssword:View {
    @State private var text: String = ""
    @State var showButtomSheet = false

    var body: some View {
        VStack{
            HStack{
            }.frame(width: 100, height: 5).background(Color(AppColors.blackColor))
            Image("success").padding(.top, 30)
                Text("Forgot Password?").font(.system(size: 24)).fontWeight(.bold).foregroundColor(Color(AppColors.blackColor)).padding(EdgeInsets(top: 15, leading: 15, bottom: 10, trailing: 15))
                Text("Kindly provide your registered email address to reset your password and follow the instructions provided in the email.").font(.system(size: 14)).foregroundColor(Color(AppColors.blackColor)).padding(EdgeInsets(top: 0, leading: 15, bottom: 15, trailing: 15))
                
                
                HStack{
                    Spacer()
                    Button(action: {
                        showButtomSheet = true
                    }) {
                        Text("Continue").padding(EdgeInsets(top: 15, leading: 100, bottom: 15, trailing: 100)).font(.system(size: 16)).fontWeight(.bold)
                            .background(Color(AppColors.secondaryColor))
                            .foregroundColor(.white)
                            .cornerRadius(15).padding(.trailing,15).sheet(isPresented: $showButtomSheet){
                                ResetPass().presentationDetents([.height(400)])
                            }
                    }
                    Spacer()
                }
            Spacer()
        }
    }
}

struct PassReset:View {
    @State private var text: String = ""
    @State var showButtomSheet = false

    var body: some View {
        VStack{
            HStack{
            }.frame(width: 100, height: 5).background(Color(AppColors.blackColor))
            
            VStack(alignment: .leading){
                Text("Forgot Password?").font(.system(size: 24)).fontWeight(.bold).foregroundColor(Color(AppColors.blackColor)).padding(EdgeInsets(top: 30, leading: 15, bottom: 10, trailing: 15))
                Text("Kindly provide your registered email address to reset your password and follow the instructions provided in the email.").font(.system(size: 14)).foregroundColor(Color(AppColors.blackColor)).padding(EdgeInsets(top: 0, leading: 15, bottom: 15, trailing: 15))
                
                HStack {
                    // Prefix Icon
                    Image("email").padding(.trailing,5)
                    
                    // TextField
                    TextField("Email address", text: $text)
                    
                    
                    
                    // Suffix Icon
                    if !text.isEmpty {
                        Button(action: {
                            text = ""
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                        }
                    }}.padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15)).overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)) .padding(15)
                HStack {
                    // Prefix Icon
                    Image("email").padding(.trailing,5)
                    
                    // TextField
                    TextField("Email address", text: $text)
                    
                    
                    
                    // Suffix Icon
                    if !text.isEmpty {
                        Button(action: {
                            text = ""
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                        }
                    }}.padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15)).overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)) .padding(15)
                HStack{
                    Spacer()
                    Button(action: {
                        showButtomSheet = true
                    }) {
                        Text("Continue").padding(EdgeInsets(top: 15, leading: 100, bottom: 15, trailing: 100)).font(.system(size: 16)).fontWeight(.bold)
                            .background(Color(AppColors.secondaryColor))
                            .foregroundColor(.white)
                            .cornerRadius(15).padding(.trailing,15).sheet(isPresented: $showButtomSheet){
                                FailReset().presentationDetents([.height(400)])
                            }
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
}


struct ResetFail:View {
    @State private var text: String = ""
    @State var showButtomSheet = false

    var body: some View {
        VStack{
            HStack{
            }.frame(width: 100, height: 5).background(Color(AppColors.blackColor))
            Image("error").padding(.top, 30)
                Text("Oops!").font(.system(size: 24)).fontWeight(.bold).foregroundColor(Color(AppColors.blackColor)).padding(EdgeInsets(top: 15, leading: 15, bottom: 10, trailing: 15))
                Text("Something went wrong with your password reset. Please check the link or contact support at info@atb-jobs.com").font(.system(size: 14)).foregroundColor(Color(AppColors.blackColor)).padding(EdgeInsets(top: 0, leading: 15, bottom: 15, trailing: 15))
                
                
                HStack{
                    Spacer()
                    Button(action: {
                        showButtomSheet = true
                    }) {
                        Text("Continue").padding(EdgeInsets(top: 15, leading: 100, bottom: 15, trailing: 100)).font(.system(size: 16)).fontWeight(.bold)
                            .background(Color(AppColors.secondaryColor))
                            .foregroundColor(.white)
                            .cornerRadius(15).padding(.trailing,15).sheet(isPresented: $showButtomSheet){
                                SuccessReset().presentationDetents([.height(400)])
                            }
                    }
                    Spacer()
                }
            Spacer()
        }
    }
}

struct ResetSuccess:View {
    @State private var text: String = ""

    var body: some View {
        VStack{
            HStack{
            }.frame(width: 100, height: 5).background(Color(AppColors.blackColor))
            Image("success").padding(.top, 30)
                Text("Password reset successfully").font(.system(size: 24)).fontWeight(.bold).foregroundColor(Color(AppColors.secondaryColor)).padding(EdgeInsets(top: 15, leading: 15, bottom: 10, trailing: 15))
                Text("you’ve successfully updated your password").font(.system(size: 14)).foregroundColor(Color(AppColors.blackColor)).padding(EdgeInsets(top: 0, leading: 15, bottom: 15, trailing: 15))
                
                
                HStack{
                    Spacer()
                    
                        Text("Continue")
                        .padding(EdgeInsets(top: 15, leading: 100, bottom: 15, trailing: 100))
                        .font(.system(size: 16)).fontWeight(.bold)
                            .background(Color(AppColors.secondaryColor))
                            .foregroundColor(.white)
                            .cornerRadius(15).padding(.trailing,15)
                    Spacer()
                }
            Spacer()
        }
    }
}
