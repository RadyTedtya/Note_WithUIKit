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
    @IBOutlet weak var tableView: UITableView!
    
    private lazy var noteTypeHeaderView: NoteTypeHeaderView = {
        .init(frame: .init(x: 0, y: 0, width: view.frame.width, height: _sectionHeight))
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _contentView.populateData()//test data
        setupHomeView()
    }
    
    
}


extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func populateDataToCell(indexpath: IndexPath) -> UITableViewCell {
        var cell = ImageNoteTableViewCell()
        cell = tableView.dequeue(ImageNoteTableViewCell.self, for: indexpath)
        cell.titleLabel.text = _contentView.notes[indexpath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var cell = UITableViewCell()
        switch _contentView.notes[indexPath.row].noteType {
        case .audioNote:
            var cell = AudioNoteTableViewCell()
            cell = tableView.dequeue(AudioNoteTableViewCell.self, for: indexPath)
            cell.titleLabel?.text = _contentView.notes[indexPath.row].title
            cell.dateLabel.text = _contentView.notes[indexPath.row].date
            return cell
        case .reminderNote:
            var cell = ReminderTableViewCell()
            cell = tableView.dequeue(ReminderTableViewCell.self, for: indexPath)
            cell.titleLabel?.text = _contentView.notes[indexPath.row].title
            cell.dateLabel.text = _contentView.notes[indexPath.row].date
            return cell
        case .imageNote:
            var cell = ImageNoteTableViewCell()
            cell = tableView.dequeue(ImageNoteTableViewCell.self, for: indexPath)
            cell.titleLabel?.text = _contentView.notes[indexPath.row].title
            cell.dateLabel.text = _contentView.notes[indexPath.row].date
            return cell
        default:
            var cell = ImageNoteTableViewCell()
            cell = tableView.dequeue(ImageNoteTableViewCell.self, for: indexPath)
            cell.titleLabel?.text = _contentView.notes[indexPath.row].title
            cell.dateLabel.text = _contentView.notes[indexPath.row].date
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _contentView.notes.count
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected \(indexPath.row)")
    }
}


extension HomeViewController {
    
    @IBAction func moveToCreateNoteView(_ sender: Any) {
        if NoteApp.shared.isLogin {
            let viewController = UINavigationController(rootViewController: CreateNoteViewController())
            viewController.modalPresentationStyle = .fullScreen
            viewController.navigationBar.backgroundColor = .primaryBackgroundColor
            self.present(viewController, animated: true)
        } else {
            navigationController?.pushViewController(LoginViewController(), animated: true)
        }
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
        if NoteApp.shared.isLogin {
            navigationController?.pushViewController(SignOutViewController(), animated: true)
        } else {
            navigationController?.pushViewController(LoginViewController(), animated: true)
        }
    }
    
    
}
