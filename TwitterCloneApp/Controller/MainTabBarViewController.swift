//
//  MainTabBarViewController.swift
//  TwitterCloneApp
//
//  Created by Yennifer Hurtado Arce on 16/08/22.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    // MARK: - Properties
    
    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .twitterBlue
        button.setImage(TwitterImages.icNewTweet.image, for: .normal)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationControllerToMain()
        addViews()
        setLayouts()
    }
    
}

// MARK: - Helpers

private extension MainTabBarViewController {
        
    func setLayouts() {
        actionButton.addCornerRadius(26)
        actionButton.anchor(bottom: view.bottomAnchor, paddingBottom: 105,
                            right: view.rightAnchor, paddingRight: 16,
                            width: 56, height: 56)
    }
    
    func addViews() {
        view.addSubview(actionButton)
    }
    
    func setNavigationControllerToMain() {
        viewControllers = setViewControllersToNavigation(
            viewControllers: [FeedViewController(iconTabBar: TwitterImages.icHomeUnselected.image),
                              ExploreViewController(iconTabBar: TwitterImages.icSearchUnselected.image),
                              NotificationViewController(iconTabBar: TwitterImages.icLikeUnselected.image),
                              MessageViewController(iconTabBar: TwitterImages.icMailSmall.image)])
    }
    
    func setViewControllersToNavigation(viewControllers: [UIViewController]) -> [UINavigationController] {
        let navigationControllers = viewControllers.compactMap{ UINavigationController(rootViewController: $0) }
        return navigationControllers
    }
}
