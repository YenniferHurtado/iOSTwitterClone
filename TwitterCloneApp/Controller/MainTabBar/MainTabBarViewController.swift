//
//  MainTabBarViewController.swift
//  TwitterCloneApp
//
//  Created by Yennifer Hurtado Arce on 16/08/22.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    // MARK: - Properties
    private let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .twitterBlue
        button.setImage(TwitterImages.icNewTweet.image, for: .normal)
        button.addTarget(self,
                         action: #selector(actionButtonTapped),
                         for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationControllerToTab()
        addViews()
        setLayouts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}

// MARK: - UI-Layouts
private extension MainTabBarViewController {
    func setLayouts() {
        actionButton.addCornerRadius(26)
        actionButton.anchor(bottom: view.bottomAnchor, paddingBottom: 105,
                            right: view.rightAnchor, paddingRight: 16,
                            width: 56, height: 56)
    }
    
    func addViews() {
        view.backgroundColor = .white
        view.addSubview(actionButton)
    }
}

// MARK: - Helpers
private extension MainTabBarViewController {
    @objc func actionButtonTapped() {
        print("prueba")
    }
    
    func setNavigationControllerToTab() {
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
