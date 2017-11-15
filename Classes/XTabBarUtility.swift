//
//  XTabBarUtility.swift
//  BonyBon
//
//  Created by Yagiz Gurgul on 13/11/2017.
//  Copyright © 2017 KukaApps. All rights reserved.
//

import UIKit

public extension UIDevice {
    
    func isiPhoneX() -> Bool
    {
        #if (arch(i386) || arch(x86_64)) && os(iOS)
            let DEVICE_IS_SIMULATOR = true
        #else
            let DEVICE_IS_SIMULATOR = false
        #endif
        
        var machineString : String = ""
        
        if DEVICE_IS_SIMULATOR == true
        {
            
            if let dir = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] {
                machineString = dir
            }
        }
        else {
            var systemInfo = utsname()
            uname(&systemInfo)
            let machineMirror = Mirror(reflecting: systemInfo.machine)
            machineString = machineMirror.children.reduce("") { identifier, element in
                guard let value = element.value as? Int8, value != 0 else { return identifier }
                return identifier + String(UnicodeScalar(UInt8(value)))
            }
        }
        
        return machineString == "iPhone10,3" || machineString == "iPhone10,6"
    }
}

public extension UIView {
    
    func setCornerRadius(topLeftRadius: CGFloat,
                         topRightRadius: CGFloat,
                         bottomRightRadius: CGFloat,
                         bottomLeftRadius: CGFloat)
    {
        
        let minx:CGFloat = self.bounds.minX
        let miny:CGFloat = self.bounds.minY
        let maxx:CGFloat = self.bounds.maxX
        let maxy:CGFloat = self.bounds.maxY
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: minx + topLeftRadius, y: miny))
        path.addLine(to: CGPoint(x: maxx - topRightRadius, y: miny))
        
        path.addArc(withCenter: CGPoint(x:maxx - topRightRadius, y: miny + topRightRadius), radius: topRightRadius, startAngle: CGFloat(3 * Double.pi / 2), endAngle: 0, clockwise: true)
        
        path.addLine(to: CGPoint(x: maxx, y: maxy - bottomRightRadius))
    
        
        path.addArc(withCenter: CGPoint(x:maxx - bottomRightRadius, y: maxy - bottomRightRadius), radius: bottomRightRadius, startAngle: 0, endAngle: CGFloat(Double.pi / 2), clockwise: true)
        
        
        path.addLine(to: CGPoint(x: minx + bottomLeftRadius, y: maxy))
        
        path.addArc(withCenter: CGPoint(x:minx + bottomLeftRadius, y: maxy - bottomLeftRadius), radius: bottomLeftRadius, startAngle: CGFloat(Double.pi / 2), endAngle: CGFloat(Double.pi), clockwise: true)
        
        path.addLine(to: CGPoint(x: minx, y: miny + topLeftRadius))
        
        path.addArc(withCenter: CGPoint(x:minx + topLeftRadius, y: miny + topLeftRadius), radius: topLeftRadius, startAngle: CGFloat(Double.pi), endAngle: CGFloat(3 * Double.pi / 2), clockwise: true)
        
        path.close()

        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
        
//
//        [path addArcWithCenter:CGPointMake(minx + bottomLeftRadius, maxy - bottomLeftRadius) radius: bottomLeftRadius startAngle: M_PI_2 endAngle:M_PI clockwise: YES];
//        [path addLineToPoint:CGPointMake(minx, miny + topLeftRadius)];
//        [path addArcWithCenter:CGPointMake(minx + topLeftRadius, miny + topLeftRadius) radius: topLeftRadius startAngle: M_PI endAngle:3 * M_PI_2 clockwise: YES];
//        [path closePath];
//
//        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
//        maskLayer.path = path.CGPath;
//        view.layer.mask = maskLayer;
    }
}
