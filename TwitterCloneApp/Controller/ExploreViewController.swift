//
//  ExploreViewController.swift
//  TwitterCloneApp
//
//  Created by Yennifer Hurtado Arce on 16/08/22.
//

import UIKit

class ExploreViewController: UIViewController {

    // MARK: - Properties

    let iconTabBar: UIImage

    // MARK: - Lifecycle
    
    init(iconTabBar: UIImage) {
        self.iconTabBar = iconTabBar
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        tabBarItem.image = iconTabBar
    }
    
    // MARK: - Helpers
}
