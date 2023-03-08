//
//  TransferFundRecipientView.swift
//  Wind App Assessment
//
//  Created by MD RUBEL on 3/8/23.
//

import UIKit
import Anchorage

class TransferFundRecipientView: UIView {
    
    let imageView = with(UIImageView()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
    }
    
    let recipientAddressLabel = with(UILabel()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = Theme.Font.medium.withSize(16.dynamic)
    }
    
    var viewModel: TransferFundViewModel
    
    init(viewModel: TransferFundViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        setupView()
        setupLayout()
        setupViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(imageView)
        addSubview(recipientAddressLabel)
    }
    
    private func setupLayout() {
        imageView.heightAnchor /==/ 36.dynamic
        imageView.widthAnchor /==/ 36.dynamic
        imageView.leftAnchor /==/ leftAnchor + 12.dynamic
        imageView.verticalAnchors /==/ verticalAnchors + 8.dynamic
        
        recipientAddressLabel.leftAnchor /==/ imageView.rightAnchor + 12.dynamic
        recipientAddressLabel.rightAnchor /==/ rightAnchor - 12.dynamic
        recipientAddressLabel.centerYAnchor /==/ imageView.centerYAnchor
    }
    
    private func setupViewModel() {
        imageView.image = viewModel.recipientImage
        recipientAddressLabel.attributedText = viewModel.recipientAddress
    }
}
