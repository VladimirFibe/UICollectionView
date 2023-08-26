import UIKit

class ViewController: UIViewController {
    private let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: ViewController.createLayout())
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.register(
            PhotoCollectionViewCell.self,
            forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        collectionView.frame = view.bounds
        collectionView.dataSource = self
        collectionView.backgroundColor = .systemBackground
    }

    static func createLayout() -> UICollectionViewCompositionalLayout {
        let item = NSCollectionLayoutItem.init(layoutSize: .init(
            widthDimension: .fractionalWidth(2 / 3),
            heightDimension: .fractionalHeight(1)))
        item.contentInsets = .init(top: 2, leading: 2, bottom: 2, trailing: 2)

        let verticalStackItem = NSCollectionLayoutItem.init(layoutSize: .init(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(0.5)))
        verticalStackItem.contentInsets = .init(top: 2, leading: 2, bottom: 2, trailing: 2)

        let tripletItem = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1 / 3),
                heightDimension: .absolute(100)))
        tripletItem.contentInsets = .init(top: 2, leading: 2, bottom: 2, trailing: 2)

        let tripletHorizontalGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(100)),
            subitems: [tripletItem])
        let verticalStackGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1 / 3),
                heightDimension: .fractionalHeight(1)),
            subitems: [verticalStackItem])

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(3/5)),
            subitems: [item, verticalStackGroup])

        let verticalGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .estimated(400)),
            subitems: [tripletHorizontalGroup, group])

        let section = NSCollectionLayoutSection(group: verticalGroup)

        return UICollectionViewCompositionalLayout(section: section)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        30
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PhotoCollectionViewCell.identifier,
            for: indexPath)
        return cell
    }
}

