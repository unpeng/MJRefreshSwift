//
//  JRefreshAutoNormalFooter.swift
//  JRefreshExanple
//
//  Created by Lee on 2018/8/23.
//  Copyright © 2018年 LEE. All rights reserved.
//

import UIKit

open class JRefreshAutoNormalFooter: JRefreshAutoStateFooter {

    public var activityIndicatorViewStyle: UIActivityIndicatorView.Style = .gray {
        didSet {
            loadingView.style = activityIndicatorViewStyle
            setNeedsLayout()
        }
    }
    public lazy var loadingView: UIActivityIndicatorView = {
        let loadingView = UIActivityIndicatorView(style: .gray)
        loadingView.hidesWhenStopped = true
        
        return loadingView
    }()
    
    override open var state: JRefreshState {
        set(newState) {
            // 状态检查
            let oldState = self.state
            if oldState == newState {
                return
            }
            super.state = newState
            
            if newState == .NoMoreData || newState == .Idle {
                loadingView.stopAnimating()
            } else if (state == .Refreshing) {
                loadingView.startAnimating()
            }
        }
        get {
            return super.state
        }
    }
}

extension JRefreshAutoNormalFooter {
    override open func prepare() {
        super.prepare()
        addSubview(loadingView)
    }
    override open func placeSubviews() {
        super.placeSubviews()
        // 圈圈
        var loadingCenterX = width * 0.5
        if !refreshingTitleHidden {
            loadingCenterX -= stateLabel.textWidth() * 0.5 + labelLeftInset
        }
        let loadingCenterY = height * 0.5
        loadingView.center = CGPoint(x: loadingCenterX, y: loadingCenterY)
    }
}














