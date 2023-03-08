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
        return nil
    }
    
    var recipientAddress: NSAttributedString? {
        return nil
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
    
    override func setupView() {
        super.setupView()
        
        view.backgroundColor = .white
        view.addSubview(backButton)
        view.addSubview(sendFundLabel)
        view.addSubview(recipientTitleLabel)
        view.addSubview(recipientView)
        
        view.addSubview(continueButton)
    }
    
    override func setupLayout() {
        super.setupLayout()
        let margin = 24.dynamic
        
        backButton.heightAnchor /==/ 30.dynamic
        backButton.widthAnchor /==/ 30.dynamic
        backButton.leftAnchor /==/ view.leftAnchor + margin
        backButton.topAnchor /==/ view.safeAreaLayoutGuide.topAnchor + margin
        
        sendFundLabel.topAnchor /==/ view.topAnchor + margin
        sendFundLabel.centerXAnchor /==/ view.centerXAnchor
        
    }
    
    deinit {
        print("==> \(#function) called on: \(Self.self)")
    }
    
    @objc private func backButtonDidTap() {
        print(#function)
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func continueButtonDidTap() {
        print(#function)
    }
}
