//
//  BookingCart.swift
//  Design
//
//  Created by Md Khorshed Alam on 15/10/24.
//

import SwiftUI

struct BookingCart: View {
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
                Text("Booking History")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(Color(AppColors.whiteColor))
                Spacer()
            }.padding()
                .frame(maxWidth: .infinity, maxHeight: 60).background(Color(AppColors.primaryColor))
            
            ScrollView {
                VStack {
                    DoctorEx(name: "Dr. Mokdad Mahmudullah Jisan", title: "Dermatologist", room: "5th Flood, Room: 501", date: "3 September, 2023", ex: "(Expired)")
                    DoctorEx(name: "Dr. Dilruba Akter", title: "Gynaecologist", room: "5th Flood, Room: 501", date: "15 September, 2023", ex: "(Expired)")
                    DoctorEx(name: "Dr. Hasan Al Mamun", title: "Cardiologist", room: "5th Flood, Room: 503", date: "7 September, 2023", ex: "(Expired)")
                    DoctorEx(name: "Dr. Naznin Nahar Nazmi", title: "Gynaecologist", room: "4th Flood, Room: 403", date: "5 September, 2023", ex: "(Expired)")
                    
                }
                .padding(.bottom, 60) // Padding at the bottom
            }
            
            Spacer()
        }
    }
}

#Preview {
    BookingCart()
}

struct DoctorEx: View {
    var name: String
    var title: String
    var room: String
    var date: String
    var ex: String
    var body: some View {
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
                            Image(systemName: "calendar")
                                .resizable()
                                .frame(width: 25, height: 25)
                            
                            Text(date)
                                .foregroundColor(Color(AppColors.blackColor))
                                .font(.system(size: 12))
                                .fontWeight(.bold)
                            Text(ex).foregroundColor(Color(AppColors.redColor))
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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .background(Color(AppColors.whiteColor))
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.3), radius: 3, x: 0, y: 0)
            .padding([.leading, .top, .trailing], 15)
    }
    }
