import SwiftUI

struct TestHistoryCart: View {
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
                Text("Test History Cart")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(Color(AppColors.whiteColor))
                Spacer()
            }.padding()
                .frame(maxWidth: .infinity, maxHeight: 60).background(Color(AppColors.primaryColor))
            
            ScrollView {
                VStack {
                    TestCartDemoHistory(name: "X-ray", room: "4th Flood, Room: 403",  date: "5 September, 2024", image: "xray", ex: "(Expired)")
                    TestCartDemoHistory(name: "MRI (Magnetic Resonance Imaging", room: "4th Flood, Room: 403", date: "5 September, 2024", image: "mri", ex: "(Expired)")
                    TestCartDemoHistory(name: "CT Scan (Computed Tomography", room: "4th Flood, Room: 403", date: "5 September, 2024", image: "ctscan", ex: "(Expired)")
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    TestHistoryCart()
}


struct TestCartDemoHistory: View {
    var name: String
    var room: String
    var date: String
    var image: String
    var ex: String
    var body: some View {
        ZStack(alignment: .leading) {
            VStack(alignment: .leading) {
                
                    Text(name)
                        .foregroundColor(Color(AppColors.primaryColor))
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
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .background(Color(AppColors.whiteColor))
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.3), radius: 3, x: 0, y: 0)
            .padding([.leading, .top, .trailing], 15)
    }
    }
