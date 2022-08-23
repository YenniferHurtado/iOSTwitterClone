//
//  NotificationViewController.swift
//  TwitterCloneApp
//
//  Created by Yennifer Hurtado Arce on 16/08/22.
//

import UIKit

class NotificationViewController: UIViewController {

    // MARK: - Properties
    
    private let iconTabBar: UIImage

    // MARK: - Lifecycle
    
    init(iconTabBar: UIImage?) {
        self.iconTabBar = iconTabBar ?? UIImage()
        super.init(nibName: nil, bundle: nil)
        tabBarItem.image = iconTabBar
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = Localizable.notification_nav_title.localized
    }
    
    // MARK: - Helpers
}
