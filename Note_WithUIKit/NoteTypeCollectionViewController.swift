//
//  NoteType_CollectionViewController.swift
//  Note_WithUIKit
//
//  Created by Tedtya rady on 19/2/2023.
//

import UIKit

private let cv_CellID = "NoteTypeCollectionViewCell"

class NoteTypeCollectionViewController: UIViewController {
    
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    
    private lazy var _collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(_collectionView)
        collectionViewSetup()
    }
    
    func collectionViewSetup() {
        _collectionView.setCollectionViewLayout(layout, animated: true)
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        _collectionView.register(UINib(nibName: "NoteTypeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cv_CellID)
        _collectionView.register(NoteTypeCollectionViewCell.self)
        view.addSubview(_collectionView)
        NSLayoutConstraint.activate([
            _collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            _collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            _collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            _collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }

}

extension NoteTypeCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return NoteType.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(NoteTypeCollectionViewCell.self, for: indexPath)
        cell.awakeFromNib()
        cell.cellButton.setTitle(String(NoteType.allCases[indexPath.item].rawValue), for: .normal)
        return cell
    }
    
    
    
}
