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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(nextScreen))
        setup()
    }

    func setup() {
        tableView.register(UINib(nibName: "ImageNote_TableViewCell", bundle: nibBundle), forCellReuseIdentifier: "ImageNote_TableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
//        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle.fill"), style: .plain, target: nibBundle, action: #selector(nextScreen))
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(nextScreen))
        title = "Home View"
        tableView.tableHeaderView = searchController.searchBar
        
        
    }
    
    @objc func nextScreen() {
        print("Profile Clicked")
    }

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageNote_TableViewCell", for: indexPath) as! ImageNote_TableViewCell
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
    
}
