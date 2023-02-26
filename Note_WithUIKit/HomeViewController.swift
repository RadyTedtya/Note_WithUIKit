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
    
    let segmentedControll: UISegmentedControl = {
        let noteType: [String] = NoteType.allCases.map { $0.rawValue }
        let sc = UISegmentedControl(items: noteType)
        return sc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle.fill"), style: .plain, target: self, action: #selector(nextScreen))
        title = "Home View"
        searchController.searchBar.barTintColor = .primaryBackgroundColor
        segmentedControll.selectedSegmentIndex = 0
        segmentedControll.tintColor = .primaryColor
        segmentedControll.translatesAutoresizingMaskIntoConstraints = true
        segmentedControll.backgroundColor = .lightGray
        tableView.register(ImageNoteTableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableHeaderView = searchController.searchBar
        
    }
    
    @objc func nextScreen() {
        let loginViewController = UINavigationController(rootViewController: LoginViewController())
        loginViewController.modalPresentationStyle = .fullScreen
        loginViewController.navigationBar.backgroundColor = .primaryBackgroundColor
        self.present(loginViewController, animated: true)
    }
    
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(ImageNoteTableViewCell.self, for: indexPath)
        cell.descriptionLabel.text = Note.dummyReminderNote.description
        cell.backgroundColor = .white
        return cell
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
//        let segmentView = UIView(frame: .zero)
//        segmentView.addSubview(segmentedControll)
//        return segmentView
        
        let cv = UIView(frame: .init(x: 0, y: 0, width: view.frame.width, height: 55))
//        cv.addSubview(collectionView)
        return cv
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 55
    }
    
    
    
    
}
