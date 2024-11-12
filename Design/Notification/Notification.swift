import SwiftUI

struct Notification: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Notifications")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(Color(AppColors.whiteColor))
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 60)
            .background(Color(AppColors.primaryColor))
            
            
            ScrollView {
                VStack {
                    NotificationContent()
                    NotificationContent()
                    NotificationContent()
                    NotificationContent()
                }
                .padding(.bottom,50)
            }
            
            
            Spacer()
        }
        .padding(.bottom) // Optional, adds padding to the bottom of the VStack
    }
}

#Preview {
    Notification()
}
struct NotificationContent: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Doctor X-ray")
                    .foregroundColor(Color(AppColors.primaryColor))
                    .font(.system(size: 16))
                    .fontWeight(.bold)

                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry")
                    .foregroundColor(Color(AppColors.blackColor))
                    .font(.system(size: 14))
                    .fontWeight(.bold)
                    .padding(.top, 15)

                HStack {
                    Image(systemName: "clock.fill")
                        .resizable()
                        .frame(width: 18, height: 18)

                    Text("14 days ago")
                        .foregroundColor(Color(AppColors.secondaryColor))
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                }
                .padding(.top, 15)//
            }
        }
        .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
        .frame(maxWidth: .infinity)
        .background(Color(AppColors.whiteColor))
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.3), radius: 3, x: 0, y: 0)
        .padding([.leading, .top, .trailing], 15)
    }
}
