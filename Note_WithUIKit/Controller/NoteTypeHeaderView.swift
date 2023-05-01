//
//  NoteTypeHeaderView.swift
//  Note_WithUIKit
//
//  Created by Tedtya rady on 26/2/2023.
//

import UIKit

class NoteTypeHeaderView: UIView {

    
    private var _viewModel: ContentViewModel!
    
    private lazy var _collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        let collectionView = UICollectionView(frame:  .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.setCollectionViewLayout(layout, animated: true)
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        collectionView.register(NoteCollectionViewCell.self)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
    }
    
    init() {
        super.init(frame: .zero)
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        let cell = collectionView.dequeue(NoteCollectionViewCell.self, for: indexPath)
        cell.awakeFromNib()
        cell.textLabel.text = String(NoteType.allCases[indexPath.item].rawValue)
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        selecetedNoteType(indexPath: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    }
    
}


extension NoteTypeHeaderView {
    
    
   
    func setupCollectionView() {
        let firstIndexPath = NSIndexPath(item: 0, section: 0)
        _collectionView.selectItem(at: firstIndexPath as IndexPath, animated: false, scrollPosition: .init())
        _collectionView.backgroundColor = .primaryBackgroundColor
        addSubview(_collectionView)
        NSLayoutConstraint.activate([
            _collectionView.topAnchor.constraint(equalTo: topAnchor),
            _collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            _collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            _collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
}
