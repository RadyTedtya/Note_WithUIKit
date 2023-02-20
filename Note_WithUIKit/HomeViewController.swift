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
    let collectionView: NoteTypeCollectionViewController = .init()
    
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
        return cell.configureCell(cell: cell, cellIndex: indexPath.row)
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
        let headerView = UIView(frame: .init(x: 0, y: 0, width: view.frame.width, height: 80))
        headerView.addSubview(collectionView.view)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
 
    
    
    
}
