//
//  TransferFundVC.swift
//  Wind App Assessment
//
//  Created by MD RUBEL on 3/8/23.
//

import UIKit
import Anchorage

class TransferFundViewModel {
    
    var recipientImage: UIImage? {
        return UIImage(named: "")
    }
    
    var recipientAddress: NSAttributedString? {
        return NSMutableAttributedString(string: "Hello")
    }
}

class TransferFundVC: BaseViewController {
    
    var viewModel: TransferFundViewModel
    
    init(viewModel: TransferFundViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var backButton = with(UIButton()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(UIImage(named: TransferFundResource.backImageName), for: .normal)
        $0.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
    }
    
    let sendFundLabel = with(UILabel()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = Theme.Font.bold.withSize(24.dynamic)
        $0.textColor = Theme.Color.label
        $0.text = TransferFundResource.sendFund.string
        $0.textAlignment = .center
    }
    
    let recipientTitleLabel = with(UILabel()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = Theme.Font.regular.withSize(16.dynamic)
        $0.textColor = Theme.Color.labelSecondary
        $0.text = TransferFundResource.recipientTitle.string
    }
    
    lazy var recipientView = with(TransferFundRecipientView(viewModel: viewModel)) {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy var amountInputView = with(TransferFundAmountInputView(viewModel: viewModel)) {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy var continueButton = with(UIButton()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle(TransferFundResource.continueButton.string, for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = Theme.Font.bold.withSize(18.dynamic)
        $0.backgroundColor = Theme.Color.secondary
        $0.isUserInteractionEnabled = false
        $0.layer.cornerRadius = 8.dynamic
        $0.clipsToBounds = true
        $0.addTarget(self, action: #selector(continueButtonDidTap), for: .touchUpInside)
    }
    
    let insufficientBalanceLabel = with(UILabel()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = Theme.Font.regular.withSize(12.dynamic)
        $0.textColor = Theme.Color.labelSecondary
        $0.numberOfLines = 1
        $0.text = TransferFundResource.insufficientBalance.string
    }
    
    let addFundButton = with(UIButton()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle(TransferFundResource.max.string, for: .normal)
        $0.setTitleColor(Theme.Color.label, for: .normal)
        $0.titleLabel?.font = Theme.Font.medium.withSize(16.dynamic)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 6.dynamic
        $0.clipsToBounds = true
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        view.endEditing(true)
    }
    
    deinit {
        print("==> \(#function) called on: \(Self.self)")
    }
    
    override func setupView() {
        super.setupView()
        
        view.backgroundColor = .white
        view.addSubview(backButton)
        view.addSubview(sendFundLabel)
        view.addSubview(recipientTitleLabel)
        view.addSubview(recipientView)
        view.addSubview(amountInputView)
        view.addSubview(continueButton)
    }
    
    override func setupLayout() {
        super.setupLayout()
        let margin = 24.dynamic
        
        backButton.heightAnchor /==/ 30.dynamic
        backButton.widthAnchor /==/ 30.dynamic
        backButton.leftAnchor /==/ view.leftAnchor + margin
        backButton.topAnchor /==/ view.safeAreaLayoutGuide.topAnchor + margin
        
        sendFundLabel.topAnchor /==/ view.safeAreaLayoutGuide.topAnchor + margin
        sendFundLabel.centerXAnchor /==/ view.centerXAnchor
        
        recipientTitleLabel.topAnchor /==/ sendFundLabel.bottomAnchor + margin
        recipientTitleLabel.horizontalAnchors /==/ view.horizontalAnchors + margin
        
        recipientView.topAnchor /==/ recipientTitleLabel.bottomAnchor + 8.dynamic
        recipientView.horizontalAnchors /==/ view.horizontalAnchors + margin
        
        amountInputView.topAnchor /==/ recipientView.bottomAnchor + 16.dynamic
        amountInputView.horizontalAnchors /==/ view.horizontalAnchors + margin
        
        continueButton.topAnchor /==/ amountInputView.bottomAnchor + margin * 3
        continueButton.horizontalAnchors /==/ view.horizontalAnchors + margin
        continueButton.heightAnchor /==/ 56.dynamic
    }
    
    @objc private func backButtonDidTap() {
        print(#function)
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func continueButtonDidTap() {
        print(#function)
    }
}
