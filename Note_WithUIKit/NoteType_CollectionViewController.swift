//
//  NoteType_CollectionViewController.swift
//  Note_WithUIKit
//
//  Created by Tedtya rady on 19/2/2023.
//

import UIKit

private let cv_CellID = "NoteType_CollectionViewCell"

class NoteType_CollectionViewController: UIViewController {
    
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    
    private lazy var _collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
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
        _collectionView.register(UINib(nibName: "NoteType_CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cv_CellID)
        view.addSubview(_collectionView)
        NSLayoutConstraint.activate([
            _collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            _collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            _collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            _collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    
}

extension NoteType_CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cv_CellID, for: indexPath) as! NoteType_CollectionViewCell
        return cell
    }
}
