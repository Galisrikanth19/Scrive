//
//  Observable.swift
//  Created by Srikanth on 01/01/23

import UIKit

class Observable<T> {
    typealias Listener = (T) -> Void
    private var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }

    init(_ value: T) {
        self.value = value
    }

    func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}

/*
 Usage sourceCode
************************************************************************************************
 var credentialsInputErrorMessage: Observable<String> = Observable("")
 var isUsernameTextFieldHighLighted: Observable<Bool> = Observable(false)
 var errorMessage: Observable<String?>?// = Observable(nil)
 
 credentialsInputErrorMessage.value = "Please provide username and password."
 isUsernameTextFieldHighLighted.value = true
 errorMessage?.value = error.localizedDescription
 
 func bindData() {
     loginViewModel.credentialsInputErrorMessage.bind { [weak self] in
        self?.loginErrorDescriptionLabel.isHidden = false
        self?.loginErrorDescriptionLabel.text = $0
     }
         
     loginViewModel.isUsernameTextFieldHighLighted.bind { [weak self] in
        if $0 { self?.highlightTextField(self?.usernameTextField) }
     }
         
     loginViewModel.errorMessage?.bind {
        guard let errorMessage = $0 else { return }
     }
}
************************************************************************************************
*/
