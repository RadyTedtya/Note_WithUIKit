//
//  HomeViewController.swift
//  Note_WithUIKit
//
//  Created by Tedtya rady on 17/2/2023.


import UIKit

class HomeViewController: UIViewController {
    
    private let _sectionHeight: CGFloat = 80
    let searchController: UISearchController! = .init()
    
    @IBOutlet weak var tableView: UITableView!
    
    private lazy var noteTypeHeaderView: NoteTypeHeaderView = {
        .init(frame: .init(x: 0, y: 0, width: view.frame.width, height: _sectionHeight))
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle.fill"), style: .plain, target: self, action: #selector(moveToLoginView))
        title = "Home View"
        searchController.searchBar.barTintColor = .primaryBackgroundColor
        tableView.register(ImageNoteTableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableHeaderView = searchController.searchBar
    }
    
    @objc func moveToLoginView() {
        if NoteApp.shared.isLogin {
            navigationController?.pushViewController(SignOutViewController(), animated: true)
        } else {
            navigationController?.pushViewController(LoginViewController(), animated: true)
        }
    }
    
}


extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(ImageNoteTableViewCell.self, for: indexPath)
        cell.descriptionLabel.text = Note.dummyReminderNote.description
        cell.backgroundColor = .primaryBackgroundColor
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
        return noteTypeHeaderView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 55
    }
    
}
