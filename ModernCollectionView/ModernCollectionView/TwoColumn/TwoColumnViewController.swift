//
//  TwoColumnViewController.swift
//  ModernCollectionView
//
//  Created by Vladimir Fibe on 27.08.2023.
//

import UIKit

final class TwoColumnViewController: UIViewController {
    enum SectionLayoutKind: Int, CaseIterable {
        case list, grid5, grid3
        var columnCount: Int {
            switch self {
            case .grid3: return 3
            case .grid5: return 5
            case .list: return 1
            }
        }
    }
    var dataSource: UICollectionViewDiffableDataSource<SectionLayoutKind, Int>! = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        configureDataSource()
    }
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: view.bounds,
            collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        return collectionView
    }()
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            let sectionLayoutKind = SectionLayoutKind(rawValue: sectionIndex) ?? .list
            let columns = sectionLayoutKind.columnCount
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = .init(top: 2, leading: 2, bottom: 2, trailing: 2)
            let groupHeight = columns == 1 ?
            NSCollectionLayoutDimension.absolute(44) : .fractionalWidth(0.2)
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: groupHeight)
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: groupSize,
                subitem: item,
                count: columns)
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = .init(top: 20, leading: 20, bottom: 20, trailing: 20)
            return section
        }
        return layout
    }
    private func configureDataSource() {
        let listCellRegistration = UICollectionView.CellRegistration<ListCell, Int> { cell, indexPath, itemIdentifier in
            cell.configure(with: "\(itemIdentifier)")
        }

        let textCellRegistration = UICollectionView.CellRegistration<TextCell, Int> { cell, indexPath, itemIdentifier in
            cell.configure(with: "\(itemIdentifier)")
        }

        dataSource = UICollectionViewDiffableDataSource<SectionLayoutKind, Int>(
            collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
                let kind = SectionLayoutKind(rawValue: indexPath.section) ?? .list
                return kind == .list
                ? collectionView.dequeueConfiguredReusableCell(
                    using: listCellRegistration, for: indexPath, item: itemIdentifier)
                : collectionView.dequeueConfiguredReusableCell(
                    using: textCellRegistration, for: indexPath, item: itemIdentifier)
            }
        let itemPerSection = 10
        var snapshot = NSDiffableDataSourceSnapshot<SectionLayoutKind, Int>()
        SectionLayoutKind.allCases.forEach {
            snapshot.appendSections([$0])
            let itemOffset = $0.rawValue * itemPerSection
            let itemUpperbound = itemOffset + itemPerSection
            snapshot.appendItems(Array(itemOffset..<itemUpperbound))
        }
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}

extension TwoColumnViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
    }
}
