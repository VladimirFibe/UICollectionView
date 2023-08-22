import SwiftUI

struct FoodControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        UINavigationController(rootViewController: FoodController())
    }

    func updateUIViewController(
        _ uiViewController: UIViewControllerType,
        context: Context) {}
}
