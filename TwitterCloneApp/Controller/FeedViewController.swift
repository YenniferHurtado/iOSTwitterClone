//
//  FeedViewController.swift
//  TwitterCloneApp
//
//  Created by Yennifer Hurtado Arce on 16/08/22.
//

import UIKit

class FeedViewController: UIViewController {

    // MARK: - Properties
    
    private let iconTabBar: UIImage

    private lazy var mainLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = TwitterImages.icTwitterLogoBlue.image
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
        
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
        configureUI()
    }
    
    // MARK: - Helpers
    
    private func configureUI() {
        navigationItem.titleView = mainLogoImageView
    }
    
}
