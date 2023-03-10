//
//  WelcomeViewController.swift
//  Note_WithUIKit
//
//  Created by Tedtya rady on 17/2/2023.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.textColor = UIColor.primaryFontColor
        descriptionLabel.text = "Capture what’s on your mind & get a reminder later at the right place or time. You can also add voice memo & other features"
    }

    @IBAction func onClicked(_ sender: Any) {
        let homeViewController = UINavigationController(rootViewController: HomeViewController())
        homeViewController.modalPresentationStyle = .fullScreen
        homeViewController.navigationBar.backgroundColor = .primaryBackgroundColor
        self.present(homeViewController, animated: true)
    }
    
}
