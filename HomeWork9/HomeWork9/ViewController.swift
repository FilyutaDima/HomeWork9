//
//  ViewController.swift
//  HomeWork9
//
//  Created by Dmitry on 15.01.22.
//

import UIKit

class ViewController: UIViewController {
    enum Properties: Double {
        case transparent = 0.2
        case nonTransparent = 1
    }
    
    enum Positions: Int {
        case first = 1
        case second = 2
        case third = 3
    }
    
    enum Modes: String {
        case start = "Start"
        case next = "Next"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTransparent(view: redSirnal, property: .transparent)
        makeCircle(from: redSirnal)
        setTransparent(view: yellowSignal, property: .transparent)
        makeCircle(from: yellowSignal)
        setTransparent(view: greenSignal, property: .transparent)
        makeCircle(from: greenSignal)
        
        setTitleButton(title: .start)
        button.layer.cornerRadius = 10
    }

    @IBOutlet var redSirnal: UIView!
    @IBOutlet var yellowSignal: UIView!
    @IBOutlet var greenSignal: UIView!
    @IBOutlet var button: UIButton!
    
    @IBAction func buttonPressed(_ sender: Any) {
        if button.title(for: .normal) == Modes.start.rawValue {
            setTitleButton(title: .next)
        }
        
        switch position {
        case Positions.first.rawValue:
            changeDirection()
            
            setTransparent(view: redSirnal, property: .nonTransparent)
            setTransparent(view: yellowSignal, property: .transparent)
            setTransparent(view: greenSignal, property: .transparent)
            
            toNextPosition()
        case Positions.second.rawValue:
            if direction {
                setTransparent(view: redSirnal, property: .nonTransparent)
                setTransparent(view: yellowSignal, property: .nonTransparent)
                setTransparent(view: greenSignal, property: .transparent)
                
                toNextPosition()
            } else {
                setTransparent(view: redSirnal, property: .transparent)
                setTransparent(view: yellowSignal, property: .nonTransparent)
                setTransparent(view: greenSignal, property: .transparent)
                
                toPrevPosition()
            }
        case Positions.third.rawValue:
            changeDirection()
            
            setTransparent(view: redSirnal, property: .transparent)
            setTransparent(view: yellowSignal, property: .transparent)
            setTransparent(view: greenSignal, property: .nonTransparent)
            
            toPrevPosition()
        default:
            break
        }
    }
    
    private func makeCircle(from view: UIView) {
        view.layer.cornerRadius = view.frame.width / 2
    }
    
    private func setTransparent(view: UIView, property: Properties) {
        view.alpha = property.rawValue
    }
    
    private func setTitleButton(title: Modes) {
        button.setTitle(title.rawValue, for: .normal)
    }
    
    private func changeDirection() {
        direction.toggle()
    }
    
    private func toPrevPosition() {
        position -= 1
    }
    
    private func toNextPosition() {
        position += 1
    }
    
    var direction = false
    var position = 1
}
