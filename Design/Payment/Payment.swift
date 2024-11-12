//
//  Payment.swift
//  Design
//
//  Created by Md Khorshed Alam on 11/10/24.
//

import SwiftUI

struct Payment: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let dataToPass: String
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
                Text("Calender")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(Color(AppColors.whiteColor))
                //                    .frame(maxWidth: .infinity, alignment: .leading alignment: .).padding(.leading, 100) // Center align text
                Spacer()
            }.padding()
                .frame(maxWidth: .infinity, maxHeight: 60).background(Color(AppColors.primaryColor))
            Spacer()
            VStack{
                Text("Payment Summary")
                    .font(.title2).fontWeight(.bold)
                    .padding(.top, 15)
                Spacer()
                Divider()
                    .padding(.top, 15)
                HStack{
                    Text("Test Name")
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                    Spacer()
                    Text("X-ray")
                        .font(.system(size: 16))
                }
                .padding(.top, 15)
                HStack{
                    Text("Price")
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                    
                    Spacer()
                    Text("3000")
                        .font(.system(size: 16))
                }
                .padding(.top, 15)
                HStack{
                    Text("Vat")
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                    Spacer()
                    Text("500")
                        .font(.system(size: 16))
                }.padding(.top, 15)
                Divider()
                    .padding(.top, 15)
                HStack{
                    Text("Total")
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                    Spacer()
                    Text("30500")
                        .font(.system(size: 16))
                }
                NavigationLink(destination: Success(dataToPass: dataToPass).navigationBarBackButtonHidden(true) ) {
                    Text("Pay Now").font(.system(size: 16)).fontWeight(.bold).padding().foregroundColor(Color(AppColors.whiteColor)).frame(maxWidth: .infinity,maxHeight: 50).background(AppColors.secondaryColor).cornerRadius(10).padding()
                        .padding(.top, 40)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 400)
                .padding()
                .background(Color(AppColors.whiteColor))
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.3), radius: 3, x: 0, y: 0)
                .padding([.leading, .top, .trailing], 15)
            HStack {
                Text("N.B: ")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .foregroundColor(AppColors.redColor)
                Text("You can cancel you booking")
                    .font(.system(size: 16))
                Spacer()
            }.padding(.top, 15).padding(.leading, 15)
            Spacer()
        }
    }
}

//#Preview {
//    Payment()
//}
