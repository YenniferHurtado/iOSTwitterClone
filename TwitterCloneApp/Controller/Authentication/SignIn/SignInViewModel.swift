//
//  SignInViewModel.swift
//  TwitterCloneApp
//
//  Created by Yennifer Hurtado Arce on 13/11/22.
//

import Foundation
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

enum SocialSignInType {
    case apple
    case google
}

class SignInViewModel {
    
    var onSignInSuccess: (() -> Void)?
    
    func startSocialSignIn(for type: SocialSignInType, view: UIViewController) {
        switch type {
        case .apple:
            signInApple()
        case .google:
            signInGoogle(view: view)
        }
    }
    
    func signInApple() {
        //needs to apple developer pay program
    }
    
    func signInGoogle(view: UIViewController) {
        //Get app clientID
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(with: config, presenting: view) { [unowned self] user, error in

          if let error = error {
            print(error.localizedDescription)
            return
          }
          guard let authentication = user?.authentication,
                let idToken = authentication.idToken else {
              return
          }
          let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
            
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                guard let userEmail = authResult?.user.email else {
                    return
                }
                Cache.saveStringData(value: userEmail, key: Key.emailGoogle.rawValue)
                self.onSignInSuccess?()
            }
        }
    }
}
