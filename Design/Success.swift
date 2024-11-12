//
//  Success.swift
//  Design
//
//  Created by Md Khorshed Alam on 11/10/24.
//

import SwiftUI

struct Success: View {
    let dataToPass: String
    var body: some View {
        VStack{
            VStack{
                Image("success")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.top, 20)
                Text("Payment successfully")
                    .font(.title2)
                    .fontWeight(.bold)
                NavigationLink(destination: Fail(dataToPass: dataToPass).navigationBarBackButtonHidden(true) ) {
                    Text("Go to Home").font(.system(size: 16)).fontWeight(.bold).padding().foregroundColor(Color(AppColors.whiteColor)).frame(maxWidth: .infinity,maxHeight: 50).background(AppColors.secondaryColor).cornerRadius(10).padding()
                        .padding(.top, 40)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 300)
            .padding()
            .background(Color(AppColors.whiteColor))
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.3), radius: 3, x: 0, y: 0)
            .padding([.leading, .top, .trailing], 15)
        }
    }
}

//#Preview {
//    Success()
//}
