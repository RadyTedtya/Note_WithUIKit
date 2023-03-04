//
//  NoteTypeHeaderView.swift
//  Note_WithUIKit
//
//  Created by Tedtya rady on 26/2/2023.
//

import UIKit

class NoteTypeHeaderView: UIView {
    
    private lazy var _collectionView: UICollectionView = {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.setCollectionViewLayout(layout, animated: true)
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        collectionView.register(NoteTypeCollectionViewCell.self)
//        collectionView.backgroundColor = .primaryColor
        
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupView() {
        addSubview(_collectionView)
        NSLayoutConstraint.activate([
            _collectionView.topAnchor.constraint(equalTo: topAnchor),
            _collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            _collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            _collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    

}

extension NoteTypeHeaderView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
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
        cell.isSelected = true
        return cell
    }
    
}
