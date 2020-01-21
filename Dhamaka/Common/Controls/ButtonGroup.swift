//
//  ButtonGroup.swift
//  Dhamaka
//
//  Created by Invariant on 21/1/20.
//  Copyright © 2020 invariant. All rights reserved.
//

import Foundation
import UIKit


class ButtonGroup{

    let buttons: [UIButton]
    let defaultBackgroundColor: UIColor?
    let defaultTitleColor: UIColor?
    
    let unSelectable: Bool
    
    let activeBackgroundColor: UIColor
    let activeTitleColor: UIColor
    
    var lastClickedButton: UIButton?
    
    init(buttons: [UIButton], activeBackground: UIColor, activeTitle: UIColor, unSelectable: Bool = false){
        self.activeBackgroundColor = activeBackground
        self.activeTitleColor = activeTitle
        
        self.buttons = buttons
        self.unSelectable = unSelectable
        self.defaultBackgroundColor = buttons[0].backgroundColor
        self.defaultTitleColor = buttons[0].titleColor(for: .normal)
    }
    
    func didTouchUpInside(button: UIButton!){
        for button in buttons{
            button.backgroundColor = defaultBackgroundColor
            button.setTitleColor(defaultTitleColor, for: .normal)
        }
        
        if (lastClickedButton == nil || unSelectable || lastClickedButton != button){
            button.backgroundColor = activeBackgroundColor
            button.setTitleColor(activeTitleColor, for: .normal)
            lastClickedButton = button
        }else{
            lastClickedButton = nil
        }
    }
    
    class func group(buttons: [UIButton], activeBackground: UIColor, activeTitle: UIColor) -> ButtonGroup{
        return ButtonGroup(buttons: buttons, activeBackground: activeBackground, activeTitle: activeTitle)
    }
}
