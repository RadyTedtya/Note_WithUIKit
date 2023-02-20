//
//  HomeViewController.swift
//  Note_WithUIKit
//
//  Created by Tedtya rady on 17/2/2023.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let searchController: UISearchController! = .init()
    let collectionView: NoteType_CollectionViewController = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup() {
        tableView.register(ImageNoteTableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle.fill"), style: .plain, target: self, action: #selector(nextScreen))
        title = "Home View"
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.barTintColor = .primaryBackgroundColor
    }
    
    @objc func nextScreen() {
        print("Profile Clicked")
    }

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(ImageNoteTableViewCell.self, for: indexPath)
        cell.backgroundColor = .primaryBackgroundColor
//        let note: Note = Note.dummyImageNote
////        cell.configure(note)
//        let image = UIImage(named: note.image ?? "photo")
//        cell.titleLabel.text = note.title.capitalized
//        cell.dateLabel.text = note.date
//        cell.pictureImageView = image
//        cell.descriptionLabel.text = note.description?.capitalized
        if (indexPath.row%2) == 0 {
            return cell
        } else {
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 430
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: .init(x: 0, y: 0, width: tableView.frame.width, height: 80))
        headerView.backgroundColor = .primaryBackgroundColor
//        headerView.addSubview(collectionView.view)
        return headerView
    }
    
    
    
    
    
}
