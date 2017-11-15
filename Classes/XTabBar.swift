//
//  XTabBar.swift
//  BonyBon
//
//  Created by Yagiz Gurgul on 13/11/2017.
//  Copyright © 2017 KukaApps. All rights reserved.
//

import UIKit


enum XTabBarStyle: Int
{
    case fullOverlay
    case fullOverlayLight
    case fillBottomHeavy
    case fillBottomLight
    case classic
}

@IBDesignable
class XTabBar: UITabBar {

    static let cornerRadiusHeavy:CGFloat = 36.0
    static let cornerRadiusLight:CGFloat = 18.0
    static let overlayMargin:CGFloat = 5.0
    
    @IBInspectable var xstyle: Int = XTabBarStyle.fullOverlay.rawValue
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        
        if UIDevice.current.isiPhoneX() == true
        {
            switch self.xstyle
            {
                case XTabBarStyle.fullOverlay.rawValue:
                    
                    if self.x != XTabBar.overlayMargin
                    {
                        var frame = self.frame
                        
                        frame.origin.x = XTabBar.overlayMargin
                        frame.origin.y = (self.superview?.frame.size.height ?? 0) - self.frame.size.height - XTabBar.overlayMargin
                        
                        frame.size.width -= XTabBar.overlayMargin
                        
                        self.setCornerRadius(topLeftRadius: XTabBar.cornerRadiusHeavy, topRightRadius: XTabBar.cornerRadiusHeavy, bottomRightRadius: XTabBar.cornerRadiusHeavy, bottomLeftRadius: XTabBar.cornerRadiusHeavy)
                        
                        self.clipsToBounds = true
                    }
                
                case XTabBarStyle.fullOverlayLight.rawValue:
                
                    if self.x != XTabBar.overlayMargin
                    {
                        var frame = self.frame
                        
                        frame.origin.x = XTabBar.overlayMargin
                        frame.origin.y = (self.superview?.frame.size.height ?? 0) - self.frame.size.height - XTabBar.overlayMargin
                        
                        frame.size.width -= XTabBar.overlayMargin
                        
                        self.setCornerRadius(topLeftRadius: XTabBar.cornerRadiusLight, topRightRadius: XTabBar.cornerRadiusLight, bottomRightRadius: XTabBar.cornerRadiusHeavy, bottomLeftRadius: XTabBar.cornerRadiusHeavy)
                        
                        self.clipsToBounds = true
                    }
                
                case XTabBarStyle.fillBottomHeavy.rawValue:
                    
                    self.clipsToBounds = true
                    self.setCornerRadius(topLeftRadius: XTabBar.cornerRadiusHeavy, topRightRadius: XTabBar.cornerRadiusHeavy, bottomRightRadius: 0, bottomLeftRadius: 0)
                
                case XTabBarStyle.fillBottomLight.rawValue:
                
                    self.clipsToBounds = true
                    self.setCornerRadius(topLeftRadius: XTabBar.cornerRadiusLight, topRightRadius: XTabBar.cornerRadiusLight, bottomRightRadius: 0, bottomLeftRadius: 0)
            
                default: break
                
            }
        }
    }
}
