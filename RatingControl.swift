//
//  RatingControl.swift
//  FoodLogger
//
//  Created by Ronny Mathew on 6/6/16.
//  Copyright © 2016 Betaturf. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    /*
     // Only override drawRect: if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func drawRect(rect: CGRect) {
     // Drawing code
     }
     */
    
    //MARK: Properties
    var rating = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    var ratingButtons = [UIButton]()
    
    let starCount = 5
    let spacing  = 5
    
    //MARK: Initializer
    required init?(coder aDecoder: NSCoder) {
        //Calling super init
        super.init(coder: aDecoder)
        for _ in 0..<starCount {
            let button = UIButton()
            let emptyStarImage = UIImage(named: "emptyStar")
            let filledStarImage = UIImage(named: "filledStar")
            
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Selected, .Highlighted])

            button.adjustsImageWhenHighlighted = false
            button.addTarget(self, action: #selector(RatingControl.buttonTapped(_:)), forControlEvents: .TouchDown)
            ratingButtons += [button]
            addSubview(button)
        }
    }
    
    
    //MARK: Intrinsic Size
    override func intrinsicContentSize() -> CGSize {
        let buttonSize = Int(frame.size.height)
        let width = (starCount * buttonSize) + (spacing * (starCount - 1))
        return CGSize(width: width, height: buttonSize)
    }
    
    //MARK: Layout subview
    override func layoutSubviews() {
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x:0, y:0, width:buttonSize, height:buttonSize)
        //Offset button x position
        for (index, button) in ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (44 + spacing))
            button.frame = buttonFrame
            updateButtonWithRating()
        }
    }
    
    //MARK: Button Action
    func buttonTapped(button: UIButton) {
        rating = ratingButtons.indexOf(button)! + 1
        updateButtonWithRating()
    }
    
    func updateButtonWithRating() {
        for (index, button) in ratingButtons.enumerate() {
            button.selected = index < rating
        }
    }
    
}
