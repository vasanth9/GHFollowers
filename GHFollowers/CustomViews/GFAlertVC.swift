//
//  GFAlertVC.swift
//  GHFollowers
//
//  Created by vasanth kumar cheepurupalli on 02/01/24.
//

import UIKit

class GFAlertVC: UIViewController {
    let containerView   = UIView()
    let titleLabel      = GFTitleLabel(textAlignment: .center, fontSize: 20)
    let messageLabel    = GFBodylabel(textAlignment: .center)
    let actionButton    = GFButton(backgroundColor: .systemPink, title: "Ok")
    
    var alertTitle:String?
    var message:String?
    var buttonTitle:String?
    
    let Padding: CGFloat = 20
    
    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle     = title
        self.message        = message
        self.buttonTitle    = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        configureContainerView()
        configureTitleLabel()
        configureActionButton()
        configureMessageLabel()
        
    }
    
    
    func configureContainerView() {
        view.addSubview(containerView)
        containerView.backgroundColor    = .systemBackground
        containerView.layer.cornerRadius = 16
        containerView.layer.borderWidth  = 2
        containerView.layer.borderColor  = UIColor.white.cgColor
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 220),
            containerView.widthAnchor.constraint(equalToConstant: 280),
        ])
        
    }
    
    
    func configureTitleLabel() {
        containerView.addSubview(titleLabel)
        titleLabel.text = alertTitle ?? "Something went wrong"
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Padding),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Padding),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 28),
        ])
    }
    
    
    func configureActionButton() {
        containerView.addSubview(actionButton)
        actionButton.setTitle(buttonTitle ?? "Ok", for: .normal)
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -Padding),
            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Padding),
            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
    
    
    func configureMessageLabel() {
        containerView.addSubview(messageLabel)
        messageLabel.text           = message ?? "Unable to complete request"
        messageLabel.numberOfLines  = 4
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Padding),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Padding),
            messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: 8),
        ])
    }
    
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
}
