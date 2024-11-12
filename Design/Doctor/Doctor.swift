import SwiftUI

struct Doctor: View {
    @State var showBottomSheet = false // State to control sheet visibility
    @State private var textFieldInput: String = ""
    @State private var load: Bool = false
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                VStack {
                    VStack(alignment: .trailing) {
                        Spacer()
                        HStack(alignment: .top, spacing: 50) {
                            TextField("Find Doctors", text: $textFieldInput)
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .frame(width: 24, height: 24)
                            
                        }
                        .padding(10).background(Color(AppColors.whiteColor)).cornerRadius(10)
                        .padding([.leading, .trailing, .top, .bottom], 15)
                        
                        Spacer()
                    }.background(Color(AppColors.primaryColor))
                        .frame(maxWidth: .infinity, maxHeight: 100)
                    if load {
                        ProgressView("Loading...") // SwiftUI's built-in loader
                            .progressViewStyle(CircularProgressViewStyle()) // Circular style loader
                            .scaleEffect(1.5) // Scale the loader if needed
                            .padding()
                    } else {
                        ScrollView {
                            VStack {
                                DoctorList(name: "Dr. Mokdad Mahmudullah Jisan", title: "Dermatologist", room: "5th Flood, Room: 501", time: "4PM - 6PM", price: "$15", image: "doc")
                                DoctorList(name: "Dr. Naznin Nahar Nazmi", title: "Gynaecologist", room: "4th Flood, Room: 403", time: "8PM - 10PM", price: "$15", image: "women")
                                DoctorList(name: "Dr. Hasan Al Mamun", title: "Cardiologist", room: "5th Flood, Room: 503", time: "8PM - 10PM", price: "$15", image: "doc")
                                DoctorList(name: "Dr. Dilruba Akter", title: "Gynaecologist", room: "5th Flood, Room: 501", time: "8PM - 10PM", price: "$15", image: "women")
                                
                            }
                            .padding(.bottom, 60) // Padding at the bottom
                        }
                    }
                }
                // Image/Button in the bottom-right corner
                VStack {
                    Spacer() // Push the content down
                    HStack {
                        Spacer() // Push the content to the right
                        Button(action: {
                            showBottomSheet = true
                        }) {
                            Image(systemName: "star.fill") // Example image
                                .resizable()
                                .frame(width: 50, height: 50) // Set the size of the image
                                .padding(.trailing, 20) // Add padding from the right edge
                                .padding(.bottom, 60).sheet(isPresented: $showBottomSheet){
                                    BottomSheetView(load: $load).presentationDetents([.height(400)])
                                }
                        }
                    }
                }
            }
        }
    }
}

// The content of your bottom sheet
struct BottomSheetView: View {
    @Binding var load: Bool
    @State private var selectedButtonIndex: Int? = nil
        
        let columns: [GridItem] = [
            GridItem(.flexible(minimum: 40)),
            GridItem(.flexible(minimum: 40)),
            GridItem(.flexible(minimum: 40)),
            //GridItem(.flexible(minimum: 40))
        ]
    @State var animals = [
            "Cardiologist",
            "Dermatologist",
            "Pediatrician",
            "Neurologist",
            "Gynecologist",
            "Orthopedic Surgeon",
            "General Physician",
            "ENT Specialist",
            "Ophthalmologist",
            "Dentist",
            "Oncologist",
            "Urologist",
            "Endocrinologist",
            "Psychiatrist",
            "Nephrologist",
            "Pulmonologist",
            "Gastroenterologist",
            "Rheumatologist",
            "Surgeon",
            "Obstetrician",
        ]
        var body: some View {
            VStack {
                Top()
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(0..<15) { index in
                            Button(action: {
                                print(load)
                                load = true
                                selectedButtonIndex = index
                                print(load)
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    load = false
                                    }
                            }) {
                                Text(animals[index])
                                    .font(.system(size: 14))
                                    .fontWeight(.bold)
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(selectedButtonIndex == index ? AppColors.primaryColor : AppColors.secondaryColor) // Fill the background color
                                    )
                                    .overlay( // Add the stroke as an overlay
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(selectedButtonIndex == index ? AppColors.primaryColor : AppColors.secondaryColor, lineWidth: 1)
                                    )
                                    .foregroundColor(selectedButtonIndex == index ? AppColors.whiteColor : AppColors.blackColor)
                                
                            }
                        }
                    }
                    .padding()
                }
            }
        }
    }

//#Preview {
//    Search()
//}

struct DoctorList: View {
    var name: String
    var title: String
    var room: String
    var time: String
    var price: String
    var image: String
    var body: some View {
        NavigationLink(destination: Booking().navigationBarBackButtonHidden(true) ) {
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
                            Image("price")
                                .resizable()
                                .frame(width: 25, height: 25)
                            
                            Text(price)
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
    }


struct Top:View {
    var body: some View {
        ZStack(alignment: .top){
            VStack{
                HStack{
                }.frame(width: 100, height: 5).background(Color(AppColors.blackColor))
                HStack{
                    Image("salary_range")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .padding(7)
                        .background(AppColors.secondaryColor.opacity(0.1))
                        .cornerRadius(20)
                    Text("Filter").font(.system(size: 14)).fontWeight(.bold).padding(.leading,10).foregroundColor(Color(AppColors.secondaryColor))
                    Spacer()
                    HStack{
                        Text("Clear Filter")
                        Image("salary_range")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                            .padding(7)
                            .background(AppColors.secondaryColor.opacity(0.1))
                            .cornerRadius(20)
                    }.padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15)).overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.black, lineWidth:0.5))
                }.padding().background(Color(AppColors.whiteColor)).background(RoundedRectangle(cornerRadius: 8)
                    .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 5))
            }
        }
    }
}
