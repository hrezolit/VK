//
//  CustomizationForAvatarBack.swift
//  VKapp1
//
//  Created by Nikita on 3/4/22.
//

import UIKit

@IBDesignable class CustomizationForAvatarBack: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var color: UIColor = .green {
        didSet {
            setNeedsDisplay()
        }
    }
    
    //MARK: - TO DO как в Storyboard изменить параметры ввода, чтоб ввод не по единицам был, а по 0,1
    @IBInspectable var alphaa: CGFloat = 0.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.setAlpha(alphaa)
        context.setFillColor(color.cgColor)
        context.fillEllipse(in: CGRect(x: rect.midX - cornerRadius,
                                       y: rect.midY - cornerRadius,
                                       width: cornerRadius * 2,
                                       height: cornerRadius * 2))
    }
}
