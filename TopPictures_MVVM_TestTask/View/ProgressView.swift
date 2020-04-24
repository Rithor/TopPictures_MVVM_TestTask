//
//  ProgressView.swift
//  TopPictures_MVVM_TestTask
//
//  Created by Vitalii on 21.11.2019.
//  Copyright © 2020 Vitalii Andrianov. All rights reserved.
//

import UIKit

open class ProgressView {
    
    private var topView: UIView
    public var containerView = UIView()
    public var progressView = UIView()
    public var activityIndicator = UIActivityIndicatorView()
    public var backgroundColor = UIColor.white.withAlphaComponent(1)
    public var forgroundColor = UIColor(red: 150.0/255.0, green: 150.0/255.0, blue: 150.0/255.0, alpha: 0.8)
    public var size: CGSize {
        didSet {
            if self.size.height < 0 {
                self.size.height = 0
            }
            if self.size.width < 0 {
                self.size.width = 0
            }
        }
    }

    public var activityStyle: UIActivityIndicatorView.Style = .large

    private var activeConstraints = [NSLayoutConstraint]()

    // MARK: - Initializer
    public init(at view: UIView) {
        self.topView = view
        self.size = CGSize(width: 80, height: 80)
        self.containerView.translatesAutoresizingMaskIntoConstraints = false
        self.progressView.clipsToBounds = true
        self.progressView.layer.cornerRadius = 10
        self.progressView.translatesAutoresizingMaskIntoConstraints = false
        self.activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    }

    // MARK: - Display
    open func showProgressView() {
        
        containerView.backgroundColor = self.backgroundColor
        progressView.backgroundColor = self.forgroundColor
        activityIndicator.style = self.activityStyle
        activityIndicator.color = .white

        topView.addSubview(containerView)
        progressView.addSubview(activityIndicator)
        containerView.addSubview(progressView)
        
        activeConstraints = [
            containerView.heightAnchor.constraint(equalTo: topView.heightAnchor),
            containerView.widthAnchor.constraint(equalTo: topView.widthAnchor),
            containerView.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            containerView.topAnchor.constraint(equalTo: topView.topAnchor),

            progressView.heightAnchor.constraint(equalToConstant: self.size.height),
            progressView.widthAnchor.constraint(equalToConstant: self.size.width),
            progressView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            progressView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),

            activityIndicator.heightAnchor.constraint(equalToConstant: self.size.height),
            activityIndicator.widthAnchor.constraint(equalToConstant: self.size.width),
            activityIndicator.centerYAnchor.constraint(equalTo: progressView.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: progressView.centerXAnchor)
        ]
        
        for constraint in activeConstraints {
            constraint.isActive = true
        }
        activityIndicator.startAnimating()
    }
    
    open func hideProgressView() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.containerView.removeFromSuperview()
            for constraint in self.activeConstraints {
                constraint.isActive = false
            }
            self.activeConstraints.removeAll()
        }
    }
    
}
