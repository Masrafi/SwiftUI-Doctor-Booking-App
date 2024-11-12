import SwiftUI

struct AppColors {
    static let blackColor = Color(.black)
    static let whiteColor = Color(.white)
    static let redColor = Color(.red)
    static let primaryColor = Color(0xff4C4A9D);
    static let secondaryColor = Color(0xffB29FF1);
    static let unFocusColor = Color(0xff72737C);

//    Color shimmerBaseColor = Colors.grey[300]!;
//    Color shimmerHighlightColor = Colors.grey[100]!;
    
}


extension Color {
    init(_ hexColor: UInt32) {
        self.init(uiColor: .init(
                      red: CGFloat(0xFF & (hexColor >> 0x10)) / 0xFF,
                    green: CGFloat(0xFF & (hexColor >> 0x08)) / 0xFF,
                     blue: CGFloat(0xFF & (hexColor >> 0x00)) / 0xFF,
                    alpha: 1.0))
    }
}

//// This for below 16
//struct AppColors {
//    static let blackColor = Color(.black)
//    static let whiteColor = Color(.white)
//    static let redColor = Color(.red)
//    static let primaryColor = Color(hex: 0xff4C4A9D)
//    static let secondaryColor = Color(hex: 0xffB29FF1)
//    static let unFocusColor = Color(hex: 0xff72737C)
//}
//
//extension Color {
//    init(hex: UInt32) {
//        self.init(UIColor(hex: hex))
//    }
//}
//
//extension UIColor {
//    convenience init(hex: UInt32) {
//        let red = CGFloat((hex >> 16) & 0xFF) / 255.0
//        let green = CGFloat((hex >> 8) & 0xFF) / 255.0
//        let blue = CGFloat(hex & 0xFF) / 255.0
//        self.init(red: red, green: green, blue: blue, alpha: 1.0)
//    }
//}
//
