//
//  LoginVC.swift
//  Wind App Assessment
//
//  Created by MD RUBEL on 3/8/23.
//

import UIKit
import Anchorage

class LoginVC: BaseViewController {
    
    let sendFundLabel = with(UILabel()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = Theme.Font.bold.withSize(24.dynamic)
        $0.textColor = Theme.Color.label
        $0.text = LoginResource.sendFund.string
        $0.setContentHuggingPriority(.defaultLow, for: .horizontal)
    }
    
    lazy var scanButton = with(UIButton()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(UIImage(named: LoginResource.scanImageName), for: .normal)
        $0.addTarget(self, action: #selector(scanButtonDidTap), for: .touchUpInside)
    }
    
    lazy var closeButton = with(UIButton()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(UIImage(named: LoginResource.closeImageName), for: .normal)
        $0.addTarget(self, action: #selector(closeButtonDidTap), for: .touchUpInside)
    }
    
    let usernameTitleLabel = with(UILabel()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = Theme.Font.regular.withSize(14.dynamic)
        $0.textColor = Theme.Color.labelSecondary
        $0.text = LoginResource.usernameTitle.string
    }
    
    lazy var usernameTextField = with(UITextField()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.borderStyle = .none
        $0.autocorrectionType = .no
        $0.spellCheckingType = .no
        $0.autocapitalizationType = .none
        $0.font = Theme.Font.medium.withSize(18.dynamic)
        $0.textColor = Theme.Color.label
        $0.placeholder = LoginResource.usernamePlaceholder.string
        $0.delegate = self
        
        let prefix = with(UILabel()) {
            $0.text = "@ "
            $0.sizeToFit()
            $0.font = Theme.Font.medium.withSize(18.dynamic)
            $0.textColor = Theme.Color.labelSecondary
        }
        
        $0.leftView = prefix
        $0.leftViewMode = .always
    }
    
    let pinTitleLabel = with(UILabel()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = Theme.Font.regular.withSize(14.dynamic)
        $0.textColor = Theme.Color.labelSecondary
        $0.text = LoginResource.pinTitle.string
    }
    
    lazy var pinTextField = with(OTPTextField()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.configure()
        $0.otpDelegate = self
    }
    
    lazy var continueButton = with(UIButton()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle(LoginResource.continueButton.string, for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = Theme.Font.bold.withSize(18.dynamic)
        $0.backgroundColor = Theme.Color.secondary
        $0.isUserInteractionEnabled = false
        $0.layer.cornerRadius = 8.dynamic
        $0.clipsToBounds = true
        $0.addTarget(self, action: #selector(continueButtonDidTap), for: .touchUpInside)
    }
    
    var viewModel: LoginViewModel?
    
    override func viewDidLoad() {
        viewModel = LoginViewModel()
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        usernameTextField.becomeFirstResponder()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        view.endEditing(true)
    }
    
    override func setupView() {
        super.setupView()
        
        view.backgroundColor = .white
        view.addSubview(sendFundLabel)
        view.addSubview(scanButton)
        view.addSubview(closeButton)
        view.addSubview(usernameTitleLabel)
        view.addSubview(usernameTextField)
        view.addSubview(pinTitleLabel)
        view.addSubview(pinTextField)
        view.addSubview(continueButton)
    }
    
    override func setupLayout() {
        super.setupLayout()
        let margin = 24.dynamic
        
        sendFundLabel.topAnchor /==/ view.safeAreaLayoutGuide.topAnchor + margin
        sendFundLabel.leftAnchor /==/ view.leftAnchor + margin
        
        scanButton.heightAnchor /==/ 30.dynamic
        scanButton.widthAnchor /==/ 30.dynamic
        scanButton.centerYAnchor /==/ sendFundLabel.centerYAnchor
        scanButton.leftAnchor /==/ sendFundLabel.rightAnchor + 8.dynamic
        
        closeButton.heightAnchor /==/ 30.dynamic
        closeButton.widthAnchor /==/ 30.dynamic
        closeButton.centerYAnchor /==/ sendFundLabel.centerYAnchor
        closeButton.leftAnchor /==/ scanButton.rightAnchor + 8.dynamic
        closeButton.rightAnchor /==/ view.rightAnchor - margin
        
        usernameTitleLabel.topAnchor /==/ sendFundLabel.bottomAnchor + margin
        usernameTitleLabel.horizontalAnchors /==/ view.horizontalAnchors + margin
        
        usernameTextField.topAnchor /==/ usernameTitleLabel.bottomAnchor + 8.dynamic
        usernameTextField.horizontalAnchors /==/ view.horizontalAnchors + margin
        usernameTextField.heightAnchor /==/ 32.dynamic
        
        pinTitleLabel.topAnchor /==/ usernameTextField.bottomAnchor + margin
        pinTitleLabel.horizontalAnchors /==/ view.horizontalAnchors + margin
        
        pinTextField.topAnchor /==/ pinTitleLabel.bottomAnchor + 8.dynamic
        pinTextField.horizontalAnchors /==/ view.horizontalAnchors + margin
        pinTextField.heightAnchor /==/ 48.dynamic
        pinTextField.updateForBottomOnlyBorder()
        
        continueButton.topAnchor /==/ pinTextField.bottomAnchor + margin * 3
        continueButton.horizontalAnchors /==/ view.horizontalAnchors + margin
        continueButton.heightAnchor /==/ 56.dynamic
    }
    
    override func setupReactive() {
        super.setupReactive()
        
        viewModel?.userData.bind { [weak self] userData in
            
            guard let user = userData else {
                self?.showLoginFailedError()
                return
            }
            
            let transferFundViewModel = TransferFundViewModel(username: user.userInfo?.userName,
                                                              wallet: user.userInfo?.walletAddress,
                                                              balance: user.accountInfo?.balance,
                                                              image: user.userInfo?.profileImage)
            
            let transferFundVC = TransferFundVC(viewModel: transferFundViewModel)
            self?.navigationController?.pushViewController(transferFundVC, animated: true)
        }
    }
    
    deinit {
        print("==> \(#function) called on: \(Self.self)")
    }
    
    private func showLoginFailedError() {
        
        let alert = UIAlertController(title: LoginResource.loginFailedTitle.string,
                                      message: LoginResource.loginFailedMessage.string,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Okay", style: .cancel))
        present(alert, animated: true)
    }
    
    // MARK: - Actions
    
    @objc private func scanButtonDidTap() {
        print(#function)
    }
    
    @objc private func closeButtonDidTap() {
        print(#function)
    }
    
    @objc private func continueButtonDidTap() {
        print(#function)
        
        guard let username = usernameTextField.text,
              let pin = pinTextField.text else {
            return
        }
        
        viewModel?.login(user: username, pin: pin)
        usernameTextField.text = nil
        pinTextField.clearText(force: true)
    }
}

extension LoginVC: OTPTextFieldDelegate {
    
    func enableNextButton() {
        pinTextField.resignFirstResponder()
        continueButton.backgroundColor = Theme.Color.primary
        continueButton.isUserInteractionEnabled = true
    }
    
    func disableNextButton() {
        continueButton.backgroundColor = Theme.Color.secondary
        continueButton.isUserInteractionEnabled = false
    }
    
    func becomingFirstResponder() {
        pinTextField.clearText()
    }
}

extension LoginVC: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if string == " " {
            return false
        }
        
        if let text = textField.text, text.isEmpty, !string.containsOnlyLetters {
            return false
        }
        
        if !string.isAlphanumeric && string == "_" && string == "." {
            return false
        }
        
        textField.text = (textField.text! as NSString).replacingCharacters(in: range, with: string.lowercased())
        return false
    }
}
