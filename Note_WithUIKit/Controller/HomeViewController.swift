//
//  HomeViewController.swift
//  Note_WithUIKit
//
//  Created by Tedtya rady on 17/2/2023.


import UIKit

class HomeViewController: UIViewController {
    
    private let _sectionHeight: CGFloat = 80
    let searchController: UISearchController! = .init()
    var _contentView: ContentViewModel = .init()
    @IBOutlet var tableView: UITableView!
    
    var dataSource: [Note] {
        switch NoteApp.shared.selectedType {
        case .audioNote:
            return _contentView.notes.filter { $0.noteType == .audioNote }
        case .imageNote:
            return _contentView.notes.filter { $0.noteType == .imageNote }
        case .reminderNote:
            return _contentView.notes.filter { $0.noteType == .reminderNote }
        case .allNotes:
            return _contentView.notes
        }
    }
    
    private lazy var noteTypeHeaderView: NoteTypeHeaderView = {
        .init(frame: .init(x: 0, y: 0, width: view.frame.width, height: _sectionHeight))
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NoteApp.shared.isLogin ? _contentView.readFromFirebase() : _contentView.populateData()
        setupHomeView()
        
    }
    
}


extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch dataSource[indexPath.row].noteType {
        case .audioNote:
            let cell = tableView.dequeue(AudioNoteTableViewCell.self, for: indexPath)
            cell.titleLabel?.text = dataSource[indexPath.row].title
            cell.dateLabel.text = dataSource[indexPath.row].date
            return cell
        case .reminderNote:
            let cell = tableView.dequeue(ReminderTableViewCell.self, for: indexPath)
            cell.titleLabel?.text = dataSource[indexPath.row].title
            cell.dateLabel.text = dataSource[indexPath.row].date
            return cell
        case .imageNote:
            let cell = tableView.dequeue(ImageNoteTableViewCell.self, for: indexPath)
            cell.titleLabel?.text = dataSource[indexPath.row].title
            cell.dateLabel.text = dataSource[indexPath.row].date
            return cell
        default:
            let cell = tableView.dequeue(ImageNoteTableViewCell.self, for: indexPath)
            cell.titleLabel?.text = dataSource[indexPath.row].title
            cell.dateLabel.text = dataSource[indexPath.row].date
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return noteTypeHeaderView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected \(indexPath.row)")
    }
}


extension HomeViewController {
    
    @IBAction func moveToCreateNoteView(_ sender: Any) {
        NoteApp.shared.isLogin ? navigationController?.pushViewController(CreateNoteViewController(), animated: true) : moveToLogin()
    }
    
    func moveToLogin() {
        let loginVC = UINavigationController(rootViewController: LoginViewController())
        loginVC.modalPresentationStyle = .fullScreen
        loginVC.navigationBar.backgroundColor = .primaryBackgroundColor
        self.present(loginVC, animated: true)
    }
    
    func setupHomeView() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle.fill"), style: .plain, target: self, action: #selector(moveToLoginView))
        title = "Home View"
        searchController.searchBar.barTintColor = .primaryBackgroundColor
        tableView.backgroundColor = .primaryBackgroundColor
        tableView.register(ImageNoteTableViewCell.self)
        tableView.register(AudioNoteTableViewCell.self)
        tableView.register(ReminderTableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableHeaderView = searchController.searchBar
    }
    
    @objc func moveToLoginView() {
        NoteApp.shared.isLogin ? navigationController?.pushViewController(SignOutViewController(), animated: true) : navigationController?.pushViewController(LoginViewController(), animated: true)
        
        
    }
    
    
}
