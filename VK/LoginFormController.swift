//
//  LoginFormController.swift
//  VK
//
//  Created by Karahanyan Levon on 04.01.2021.
//

import UIKit

class LoginFormController: UIViewController {

    @IBOutlet weak var logoVK: UIImageView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginVK: UITextField!
    @IBOutlet weak var passwordVK: UITextField!
    
    private var keyboardShown = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareElementsToView()
        addTapGestureRecognizer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        addKeyboardObservers()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        removeKeyboardObservers()
    }
    
    private func prepareElementsToView() {
        logoVK.layer.cornerRadius = 20
        logoVK.clipsToBounds = true

        loginButton.layer.cornerRadius = 10
        loginButton.clipsToBounds = true
    }
    
    private func addKeyboardObservers() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWasShown),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillBeHidden),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    private func removeKeyboardObservers() {
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillShowNotification,
                                                  object: nil)

        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardDidHideNotification,
                                                  object: nil)
    }
    
    private func addTapGestureRecognizer() {
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
    }
    
    @objc private func keyboardWasShown(notification: Notification) {
        guard !keyboardShown else { return }
        let info = notification.userInfo! as NSDictionary
        let kbsize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbsize.height, right: 0.0)
        

        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
        keyboardShown = true
    }

    @objc private func keyboardWillBeHidden() {
        guard keyboardShown else { return }
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
        keyboardShown = false
    }

    @objc private func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
}
