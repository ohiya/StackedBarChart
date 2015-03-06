//
//  StackedBarChart.swift
//  StackedBarChart
//
//  Created by Michael Schoder on 06.03.15.
//  Copyright (c) 2015 Chromo. All rights reserved.
//

import UIKit

class StackedBarChart: UIView {
    private var segments: Array<BarSegment>!
    private var segViews: Array<UIView>!
    
    override init(frame: CGRect) {
        self.segments = Array<BarSegment>()
        self.segViews = Array<UIView>()
        
        let finalFrame: CGRect = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, 2)
        super.init(frame: finalFrame)
        self.backgroundColor = UIColor.lightGrayColor()
    }
    
    init(frame: CGRect, forceHeight: Bool) {
        self.segments = Array<BarSegment>()
        self.segViews = Array<UIView>()
        
        var finalFrame: CGRect!
        if !forceHeight {
            finalFrame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, 2)
        } else {
            finalFrame = frame
        }
        super.init(frame: finalFrame)
        self.backgroundColor = UIColor.lightGrayColor()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func addSegment(s: BarSegment){
        self.segments.append(s)
    }
    
    internal func draw(){
        self.clear()
        for var i = 0; i < self.segments.count; i++ {
            var x: CGFloat = 0
            var width: CGFloat = (CGFloat(self.segments[i].value) / CGFloat(self.summ()))*self.frame.size.width
            
            if i > 0 {
                x = self.segViews[i-1].frame.origin.x + self.segViews[i-1].frame.size.width
            }
            let view: UIView = UIView(frame: CGRectMake(x, 0, width, self.frame.size.height))
            view.backgroundColor = self.segments[i].color
            self.segViews.append(view)
            self.addSubview(view)
        }
    }
    
    internal func drawSorted(){
        self.segments.sort({ $0.value > $1.value })
        for var i = 0; i < self.segments.count; i++ {
            if self.segments[i].isEmpty {
                self.segments.append(self.segments[i])
                self.segments.removeAtIndex(i)
            }
        }
        self.draw()
    }
    
    private func clear(){
        if self.segViews.count > 0 {
            for var i = 0; i < self.segments.count; i++ {
                self.segViews[i].removeFromSuperview()
                self.segViews.removeAtIndex(i)
            }
        }
    }
    
    private func summ() -> Float {
        var summ: Float = 0
        for var i = 0; i < segments.count ; i++ {
            summ += self.segments[i].value
        }
        return summ
    }
}

class BarSegment: NSObject {
    internal var color: UIColor!
    internal var value: Float!
    internal var isEmpty = false
    
    init(EmptySegmentWithvalue v: Float){
        self.value = v
        self.color = UIColor.lightGrayColor()
        self.isEmpty = true
    }
    
    init(value v: Float, color c: UIColor){
        self.value = v
        self.color = c
    }
}
