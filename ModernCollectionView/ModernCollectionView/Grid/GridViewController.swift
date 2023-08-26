import UIKit

final class GridViewController: UIViewController {
    enum Section {
        case main
    }
    var dataSource: UICollectionViewDiffableDataSource<Section, Int>! = nil
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: view.bounds,
            collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .black
        return collectionView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureDataSource()
    }
    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.2),
            heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(0.2))
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    private func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<TextCell, Int> { cell, indexPath, itemIdentifier in
            cell.configure(with: "\(itemIdentifier)")
        }
        dataSource = UICollectionViewDiffableDataSource<Section, Int>(
            collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        })
        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        snapshot.appendSections([.main])
        snapshot.appendItems(Array(0..<94))
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    private func setupViews() {
        view.addSubview(collectionView)
    }
}
