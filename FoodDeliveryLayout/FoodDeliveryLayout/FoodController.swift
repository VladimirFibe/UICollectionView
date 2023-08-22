import SwiftUI

class FoodController: UICollectionViewController {
    let cellId = "cellId"
    init() {
        let layout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: layout)
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
        8
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: cellId,
            for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        navigationItem.title = "Food Delivery"
        collectionView.register(
            UICollectionViewCell.self,
            forCellWithReuseIdentifier: cellId)
    }
}








struct FoodControllerPreview: PreviewProvider {
    static var previews: some View {
        FoodControllerRepresentable().ignoresSafeArea()
    }
}
