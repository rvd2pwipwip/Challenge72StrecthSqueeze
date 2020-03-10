//
//  ViewController.swift
//  Challenge72StrecthSqueeze
//
//  Created by Herve Desrosiers on 2020-03-09.
//  Copyright © 2020 Herve Desrosiers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let fontSize: CGFloat = 24.0

    override func viewDidLoad() {
        super.viewDidLoad()
        quoteLabel.text = "To be, or not to be, that is the question"
        setupView()
    }
    
    private func setupView() {
        view.addSubview(shareButton)
        view.addSubview(quoteLabel)
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            shareButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            shareButton.topAnchor.constraint(equalTo: margins.topAnchor),
            quoteLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: shareButton.trailingAnchor, multiplier: 1),
            quoteLabel.topAnchor.constraint(equalTo: margins.topAnchor),
            quoteLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        ])
    }

    private lazy var shareButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(NSLocalizedString("Share", comment: "Share button title"), for: .normal)
        button.backgroundColor = .yellow
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: fontSize)
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        button.addTarget(self, action: #selector(shareQuote(_:)), for: .touchUpInside)
        return button
    }()
    
    //The label has a default content hugging priority of 251 in Interface
    //Builder and 250 if created in code. The button always has a default
    //content hugging priority of 250. The button and label have default
    //compression resistance priorities of 750.
    
    private let quoteLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .purple
        label.textColor = .white
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 24)
        label.setContentHuggingPriority(.defaultLow - 1, for: .horizontal)
        label.setContentCompressionResistancePriority(.defaultHigh - 1, for: .horizontal)
        return label
    }()

    @objc private func shareQuote(_ sender: UIButton) {
        print("Share quote")
    }
}

