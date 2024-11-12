import SwiftUI

struct Home: View {
    let images = ["sl1", "sl2", "sl3", "sl4"] // Add your image names here
        @State private var currentIndex = 0
        private let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect() // 1 second timer
    @State var gridLayout = [GridItem(.adaptive(minimum: 100)), GridItem(.flexible())]
    @State var test = [
        "X-rays",
        "MRI (Magnetic Resonance Imaging)",
        "CT Scan (Computed Tomography)",
        "24-Hour Urine Test",
        "Pregnancy Test",
        "Urine Culture",
        "Electrocardiogram (ECG or EKG)",
        "Echocardiogram",
        "COVID-19 Test (PCR, Rapid Antigen)",
        "HIV Test",
        "Blood Allergy Test (RAST)",
        "Hormone Level Testing",
        "Complete Blood Count (CBC)",
        "Blood Glucose Test",
        "Lipid Profile (Cholesterol Test)",
        "Liver Function Test",
        "Kidney Function Test",
        "Thyroid Function Test",
        ]
    var body: some View {
        NavigationStack {
            VStack {
                
                // }
                Text("Home")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(Color(AppColors.whiteColor))
                    .frame(maxWidth: .infinity, maxHeight: 60)
                    .background(AppColors.primaryColor)
                
                ScrollView {
                    VStack(alignment: .leading) {
                        TabView(selection: $currentIndex) {
                            ForEach(0..<images.count, id: \.self) { index in
                                Image(images[index])
                                    .resizable()
                                //.scaledToFit()
                                //.padding(.all, 5)
                                    .frame(maxWidth: .infinity, maxHeight: 200)
                                    .tag(index) // Tag to track the index
                                
                                    .cornerRadius(30)
                            }.padding()
                        }
                        
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        // Hides default page indicator
                        .frame(width: .infinity, height: 200) // Set the desired height
                        
                        .onReceive(timer) { _ in
                            withAnimation {
                                //currentIndex = (currentIndex + 1) % images.count // Loop through images
                                if currentIndex < images.count - 1 {
                                    currentIndex += 1
                                } else {
                                    currentIndex = 0 // Reset to the first image smoothly
                                }
                            }
                        }
                        
                        HStack(spacing: 10) {
                            Spacer()
                            ForEach(0..<images.count, id: \.self) { index in
                                Circle()
                                    .fill(index == currentIndex ? AppColors.primaryColor : Color.gray) // Fill based on currentIndex
                                    .frame(width: 10, height: 10) // Size of the circle
                            }
                            Spacer()
                        }
                        
                        //JobBody()
                        Text("Saturdar 08, 2024")
                            .foregroundColor(Color(AppColors.primaryColor))
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.bottom, 10)
                            .padding(.top, 20)
                        HStack(spacing: 10){
                            DailyStatus(title: "Avaiable Bed", value: "35/100")
                            DailyStatus(title: "Avaiable Caben", value: "20/100")
                        }
                        HStack(spacing: 10){
                            DailyStatus(title: "Avaiable ICU", value: "18/100")
                            DailyStatus(title: "Avaiable CCU", value: "34/100")
                        }
                        Text("Book your test")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .padding([.leading, .top], 15)
                        ScrollView(.vertical) {
                            VStack {
                                ForEach(test.indices, id: \.self) { i in
                                    ProductView(title: test[i], size: 150)
                                }
                            }.padding(.top, 10)
                        }
                        
                        Spacer()
                    }.padding(.bottom, 50)
                }
            }
        }
    }
}
//}

#Preview {
    Home()
}

struct ProductView: View {
    let title: String
    let size: CGFloat
    var body: some View {
        NavigationLink(destination: Calender().navigationBarBackButtonHidden(true) ) {
            VStack(spacing: 15){
                HStack{
                    Text(title)
                    Spacer()
                    Image(systemName: "chevron.forward")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .background(Color(AppColors.whiteColor))
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.3), radius: 3, x: 0, y: 0)
            .padding([.leading, .trailing, .bottom], 15)
        }
    }
}

struct JobBody: View {
    var body: some View {
        ZStack(alignment: .leading) {
            HStack{
                Spacer()
                Image("total")
                    .resizable()
                    .frame(width: 100, height: 120)
            }
            VStack(alignment: .leading) {
                Text("Saturdar 08, 2024")
                    .foregroundColor(Color(AppColors.primaryColor))
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.bottom, 10)
                Text("Avaiable caben: 50 out of 100")
                    .foregroundColor(Color(AppColors.blackColor))
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .padding(.bottom, 5)
                Text("Avaiable bed: 20 out of 100")
                    .foregroundColor(Color(AppColors.blackColor))
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .padding(.bottom, 5)
                Text("Avaiable ICU bed: 18 out of 100")
                    .foregroundColor(Color(AppColors.blackColor))
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .padding(.bottom, 5)
                
                Spacer()
            }
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .background(Color(AppColors.whiteColor))
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.3), radius: 3, x: 0, y: 0)
            .padding(.all, 15)
            
        }
    }

struct DailyStatus: View {
    var title: String
    var value: String
    var body: some View {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 16))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(AppColors.primaryColor)
                    .padding(.bottom, 10)
                Text(value)
                    .font(.system(size: 14))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(AppColors.blackColor)
            }
        .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
        .frame(maxWidth: .infinity)
        .background(Color(AppColors.whiteColor))
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.3), radius: 3, x: 0, y: 0)
        .padding([.leading, .trailing], 15)
    }
}
