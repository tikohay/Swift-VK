//
//  LoginFormController.swift
//  VK
//
//  Created by Karahanyan Levon on 04.01.2021.
//

import UIKit

class LoginFormController: UIViewController {

    @IBOutlet weak var logoVKImage: UIImageView?
    @IBOutlet weak var loginButton: UIButton?
    @IBOutlet weak var scrollView: UIScrollView?
    @IBOutlet weak var loginVKTextField: UITextField?
    @IBOutlet weak var passwordVKTextField: UITextField?
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var hidePasswordButton: UIButton?
    
    private var isPasswordHidden = true
    private var keyboardShown = false
    
    @IBAction func tappedLogin(_ sender: UIButton) {
        guard let loginButton = loginButton else { return }
        animateView(loginButton)
    }
    
    @IBAction func onHidePasswordButtonClick(_ sender: UIButton) {
        
        let imageEye = UIImage(systemName: "eye")
        let imageEyeSlash = UIImage(systemName: "eye.slash")
        
        if isPasswordHidden {
            passwordVKTextField?.isSecureTextEntry = false
            sender.setImage(imageEyeSlash, for: .normal)
        } else {
            passwordVKTextField?.isSecureTextEntry = true
            sender.setImage(imageEye, for: .normal)
        }
        
        isPasswordHidden.toggle()
    }
    
    @IBAction func logOutSegue(unwindSegue: UIStoryboardSegue) {
        
    }
    
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
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let checkResult = checkUserData()
        
        if !checkResult {
            showLoginError()
        }
        return checkResult
    }
    
    private func animateView(_ viewToAnimate: UIView) {
        UIView.animate(withDuration: 0.15,
                       delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 0.5,
                       options: .curveEaseIn,
                       animations: {
                        viewToAnimate.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
                       }) { (_) in
            UIView.animate(withDuration: 0.15,
                           delay: 0,
                           usingSpringWithDamping: 0.4,
                           initialSpringVelocity: 2,
                           options: .curveEaseIn,
                           animations: {
                            viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
                           }, completion: nil)
        }
    }
    
    private func prepareElementsToView() {
        logoVKImage?.layer.cornerRadius = 20
        logoVKImage?.clipsToBounds = true
        
        loginButton?.layer.cornerRadius = 10
        loginButton?.clipsToBounds = true
        
        stackView.spacing = 0.2
        
        loginVKTextField?.layer.cornerRadius = 10
        loginVKTextField?.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        passwordVKTextField?.layer.cornerRadius = 10
        passwordVKTextField?.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
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
    
    private func checkUserData() -> Bool {
        return true
//        guard let login = loginVKTextField?.text, let password = passwordVKTextField?.text else {
//            return false
//        }
//        return login == "admin" && password == "1234567"
    }
    
    private func showLoginError() {
        let alert = UIAlertController(title: "Ошибка", message: "вы ввели неправильные данные", preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @objc private func keyboardWasShown(notification: Notification) {
        guard !keyboardShown else { return }
        let info = notification.userInfo! as NSDictionary
        let kbsize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbsize.height, right: 0.0)
        
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
        keyboardShown = true
        
        hidePasswordButton?.isHidden = false
    }
    
    @objc private func keyboardWillBeHidden() {
        guard keyboardShown else { return }
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
        keyboardShown = false
        
        hidePasswordButton?.isHidden = true
    }
    
    @objc private func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
}
