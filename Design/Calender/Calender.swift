import SwiftUI

struct Calender: View {
    @State private var selectedDate = Date()
    @State private var load = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let columns: [GridItem] = [
        GridItem(.flexible(minimum: 40)),
        GridItem(.flexible(minimum: 40)),
        GridItem(.flexible(minimum: 40)),
        //GridItem(.flexible(minimum: 40))
    ]
    @State private var selectedButtonIndex: Int? = nil
    @State var schedule = [
            "00.00-1.00",
            "01.00-02.00",
            "02.00-03.00",
            "03.00-04.00",
            "04.00-05.00",
            "05.00-06.00",
            "06.00-07.00",
            "07.00-08.00",
            "08.00-09.00",
            "09.00-10.00",
            "10.00-11.00",
            "11.00-12.00",
            "12.00-13.00",
            "13.00-14.00",
            "14.00-15.00",
            "15.00-16.00",
            "16.00-17.00",
            "17.00-18.00",
            "18.00-19.00",
            "19.00-20.00",
            "20.00-21.00",
            "21.00-22.00",
            "22.00-23.00",
            "23.00-24.00",
        ]
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
                Text("Calender")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(Color(AppColors.whiteColor))
                //                    .frame(maxWidth: .infinity, alignment: .leading alignment: .).padding(.leading, 100) // Center align text
                Spacer()
            }.padding()
                .frame(maxWidth: .infinity, maxHeight: 60).background(Color(AppColors.primaryColor))
            VStack{
                ScrollView{
                HStack {
                    //Text("Select date: ")
                    Spacer()
                    DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
                        //.labelsHidden()
                        //.transformEffect(.init(scaleX: 0.8, y: 0.8))
                        .font(.system(size: 12))
                        .onChange(of: selectedDate) {
                            load = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                load = false
                            }
                        }
                    
                    //.padding(.horizontal)
                        .datePickerStyle(.graphical)
                    
                }
                if load {
                    ProgressView("Loading...") // SwiftUI's built-in loader
                        .progressViewStyle(CircularProgressViewStyle()) // Circular style loader
                        .scaleEffect(1.5) // Scale the loader if needed
                        .padding()
                } else {
                    HStack{
                        Spacer()
                        HStack{
                            Text("")
                                .padding()
                                .background(Color.yellow)
                                .frame(width: 20, height: 20)
                                .clipShape(Circle())
                            Text("Booked")
                                .font(.system(size: 12))
                                .fontWeight(.bold)
                        }
                        Spacer()
                        HStack{
                            Text("")
                                .padding()
                                .background(AppColors.secondaryColor)
                                .frame(width: 20, height: 20)
                                .clipShape(Circle())
                            Text("Available")
                                .font(.system(size: 12))
                                .fontWeight(.bold)
                        }
                        Spacer()
                        HStack{
                            Text("")
                                .padding()
                                .background(AppColors.primaryColor)
                                .frame(width: 20, height: 20)
                                .clipShape(Circle())
                            Text("Booking")
                                .font(.system(size: 12))
                                .fontWeight(.bold)
                        }
                        Spacer()
                    }
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(schedule.indices, id: \.self) { index in
                            Button(action: {
                                print(load)
                                //load = true
                                selectedButtonIndex = index
                                //                                print(load)
                                //                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                //                                    load = false
                                //                                }
                            }) {
                            
                                Text(schedule[index])
                                    .font(.system(size: 12))
                                    .fontWeight(.bold)
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(index == 1 || index == 3 || index == 5 || index == 10 ?Color(.yellow):(selectedButtonIndex == index ? AppColors.primaryColor : AppColors.secondaryColor)) // Fill the background color
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
                    NavigationLink(destination: Payment(dataToPass: "home").navigationBarBackButtonHidden(true) ) {
                        Text("Continue").font(.system(size: 16)).fontWeight(.bold).padding().foregroundColor(Color(AppColors.whiteColor)).frame(maxWidth: .infinity,maxHeight: 50).background(AppColors.secondaryColor).cornerRadius(10).padding()
                            .padding(.bottom, 50)
                    }
            }
                Spacer()
            }
                
            Spacer()
        }
    }
}

#Preview {
    Calender()
}
