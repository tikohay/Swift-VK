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
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue) {
        
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        logoVK.layer.cornerRadius = 20
        logoVK.clipsToBounds = true

        loginButton.layer.cornerRadius = 10
        loginButton.clipsToBounds = true
        
        
        
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
    }
    
    
    
    @objc func keyboardWasShown(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbsize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbsize.height, right: 0.0)
        

        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }

    @objc func keyboardWillBeHidden() {
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidHideNotification, object: nil)
    }

    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let checkResult = checkUserData()
        
        if !checkResult {
            showLoginError()
        }
        return checkResult
    }
    
    func checkUserData() -> Bool {
        guard let login = loginVK.text, let password = passwordVK.text else {
            return false
        }
        
        if login == "admin" && password == "1234567" {
            return true
        } else {
            return false
        }
    }
    
    func showLoginError() {
        let alert = UIAlertController(title: "Ошибка", message: "вы ввели неправильные данные", preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
