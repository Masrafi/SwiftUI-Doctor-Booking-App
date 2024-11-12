import SwiftUI

struct DoctorCart: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrowshape.backward.fill")
                        .foregroundColor(Color(AppColors.whiteColor))
                }
                Spacer()
                // }
                Text("Doctor Cart")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(Color(AppColors.whiteColor))
                Spacer()
            }.padding()
                .frame(maxWidth: .infinity, maxHeight: 60).background(Color(AppColors.primaryColor))
            
            ScrollView {
                VStack {
                    DoctorBooked(name: "Dr. Mokdad Mahmudullah Jisan", title: "Dermatologist", room: "5th Flood, Room: 501", time: "4PM - 6PM", date: "3 September, 2024", image: "doc")
                    DoctorBooked(name: "Dr. Dilruba Akter", title: "Gynaecologist", room: "5th Flood, Room: 501", time: "8PM - 10PM", date: "15 September, 2024", image: "women")
                    DoctorBooked(name: "Dr. Hasan Al Mamun", title: "Cardiologist", room: "5th Flood, Room: 503", time: "8PM - 10PM", date: "7 September, 2024", image: "doc")
                    DoctorBooked(name: "Dr. Naznin Nahar Nazmi", title: "Gynaecologist", room: "4th Flood, Room: 403", time: "8PM - 10PM", date: "5 September, 2024", image: "women")
                    
                }
                .padding(.bottom, 60) // Padding at the bottom
            }
            
            Spacer()
        }
    }
}

#Preview {
    DoctorCart()
}


struct DoctorBooked: View {
    var name: String
    var title: String
    var room: String
    var time: String
    var date: String
    var image: String
    var body: some View {
        ZStack(alignment: .leading) {
            HStack {
                Spacer()
                Image(image)
                    .resizable()
                    .frame(width: 150, height: 150)
            }
            VStack(alignment: .leading) {
                
                    Text(name)
                        .foregroundColor(Color(AppColors.primaryColor))
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                Text(title)
                    .foregroundColor(Color(AppColors.secondaryColor))
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "location.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .padding(7)
                                .background(AppColors.secondaryColor.opacity(0.1))
                                .cornerRadius(20)
                            
                            Text(room)
                                .foregroundColor(Color(AppColors.blackColor))
                                .font(.system(size: 16))
                                .fontWeight(.bold)
                        }
                        
                        HStack {
                            Image(systemName: "clock.fill")
                                .resizable()
                                .frame(width: 18, height: 18)
                            
                            Text(time)
                                .foregroundColor(Color(AppColors.secondaryColor))
                                .font(.system(size: 12))
                                .fontWeight(.bold)
                        }
                        .padding(.top, 10)
                        HStack {
                            Image(systemName: "calendar")
                                .resizable()
                                .frame(width: 25, height: 25)
                            
                            Text(date)
                                .foregroundColor(Color(AppColors.blackColor))
                                .font(.system(size: 12))
                                .fontWeight(.bold)
                        }
                        .padding(.top, 10)
                    }
                    
                    Spacer()
                    
                    Image("job_image")
                        .foregroundColor(Color(AppColors.whiteColor))
                }
                
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .background(Color(AppColors.whiteColor))
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.3), radius: 3, x: 0, y: 0)
            .padding([.leading, .top, .trailing], 15)
    }
    }
