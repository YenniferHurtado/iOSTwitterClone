//
//  RegistrationViewController.swift
//  TwitterCloneApp
//
//  Created by Yennifer Hurtado Arce on 21/08/22.
//

import UIKit

class RegistrationViewController: UIViewController {

    // MARK: - Properties
    private let registrationView = RegistrationView()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        addSubViews()
        setLayouts()
        initDelegate()
//        hideBackBarButton()
    }
}

// MARK: - Helpers
extension RegistrationViewController {
    func tapHideKeywoard() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }
//    func hideBackBarButton() {
//        navigationItem.setHidesBackButton(true, animated: true)
//    }
}

//MARK: Registration Delegate
extension RegistrationViewController: RegistrationViewDelegate {
    func addProfileImageView() {
        let pickerView = registrationView.pickerView
        present(pickerView, animated: true)
        pickerView.delegate = self
        pickerView.allowsEditing = true
    }
    func handleSignIn() {
        print("sign in")
    }
    func initDelegate() {
        registrationView.delegate = self
    }
    func backToLogin() {
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - UIPickerViewDelegate
extension RegistrationViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let profileImage = info[.editedImage] as? UIImage else { return }
        registrationView.plusPhotoButton.setImage(profileImage.withRenderingMode(.alwaysOriginal), for: .normal)
        dismiss(animated: true, completion: nil)
    }
}


//MARK: AutoLayouts
private extension RegistrationViewController {
    
    func configureUI() {
        view.backgroundColor = .twitterBlue
    }
    func setLayouts() {
        registrationView.anchor(top: view.topAnchor, bottom: view.bottomAnchor,
                                left: view.leftAnchor, right: view.rightAnchor)
    }
    func addSubViews() {
        view.addSubview(registrationView)
    }
}
