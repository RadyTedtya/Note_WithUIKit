//
//  HomeViewController.swift
//  Note_WithUIKit
//
//  Created by Tedtya rady on 17/2/2023.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let navigationView: UINavigationController! = .init()
    let searchController: UISearchController! = .init()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setup()
        
    }

    func setup() {
        tableView.register(UINib(nibName: "ImageNote_TableViewCell", bundle: nibBundle), forCellReuseIdentifier: "ImageNote_TableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        title = "Home View"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "person.crop.circle.fill"), style: .plain, target: nibBundle, action: #selector(nextScreen))
        tableView.tableHeaderView = searchController.searchBar
    }
    
    @objc func nextScreen() {
        print("Profile Clicked")
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageNote_TableViewCell", for: indexPath) as! ImageNote_TableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    
}
