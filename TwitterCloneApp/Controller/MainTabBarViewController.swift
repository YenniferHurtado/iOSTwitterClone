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
        setNavigationControllerToMain()
    }
    
    // MARK: - Helpers
    
    private func setNavigationControllerToMain() {
        viewControllers = setViewControllersToNavigation(
            viewControllers: [FeedViewController(iconTabBar: TwitterImages.icHomeUnselected.image),
                              ExploreViewController(iconTabBar: TwitterImages.icSearchUnselected.image),
                              NotificationViewController(iconTabBar: TwitterImages.icLikeUnselected.image),
                              MessageViewController(iconTabBar: TwitterImages.icMailSmall.image)])
    }
    
    private func setViewControllersToNavigation(viewControllers: [UIViewController]) -> [UINavigationController] {
        let navigationControllers = viewControllers.compactMap{ UINavigationController(rootViewController: $0) }
        return navigationControllers
    }
    
}

