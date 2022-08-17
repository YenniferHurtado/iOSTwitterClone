//
//  MainTabBarViewController.swift
//  TwitterCloneApp
//
//  Created by Yennifer Hurtado Arce on 16/08/22.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewControllersToTab()
    }
    
    // MARK: - Helpers
    
    private func setViewControllersToTab() {
        
        viewControllers = [FeedViewController(iconTabBar: TwitterImages.icDownArrow.image!),
                           ExploreViewController(iconTabBar: TwitterImages.icComment.image!),
                           MessageViewController(iconTabBar: TwitterImages.icLike.image!),
                           NotificationViewController(iconTabBar: TwitterImages.icShare.image!)]
    }
}
