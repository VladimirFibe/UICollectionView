import SwiftUI

class FoodController: UICollectionViewController {
    let cellId = "cellId"
    init() {
        let layout = UICollectionViewCompositionalLayout { sectionNumber, _ in
            let item = NSCollectionLayoutItem(layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)))
            item.contentInsets.bottom = 16

            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: .init(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(300)),
                subitems: [item])

            let section = NSCollectionLayoutSection(group: group)
            return section
        }

        super.init(collectionViewLayout: layout)
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
        3
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
