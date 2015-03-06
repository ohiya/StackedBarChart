//
//  TableViewController.swift
//  StackedBarChart
//
//  Created by Michael Schoder on 06.03.15.
//  Copyright (c) 2015 Chromo. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return 5
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 66
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Default", forIndexPath: indexPath) as UITableViewCell
        
        let label = UILabel(frame: CGRectMake(15, 8, 350, 20))
        
        if indexPath.row == 0 {
            label.text = "Standard Chart"
            let chart = StackedBarChart(frame: CGRectMake(16, cell.frame.height - 16, cell.frame.width - 8 - 16, 2))
            chart.addSegment(BarSegment(value: Float(arc4random()), color: UIColor.redColor()))
            chart.addSegment(BarSegment(value: Float(arc4random()), color: UIColor.blueColor()))
            chart.addSegment(BarSegment(value: Float(arc4random()), color: UIColor.greenColor()))
            chart.draw()
            cell.addSubview(chart)
        } else if indexPath.row == 1 {
            label.text = "Chart with Empty Segment"
            let chart = StackedBarChart(frame: CGRectMake(16, cell.frame.height - 16, cell.frame.width - 8 - 16, 2))
            chart.addSegment(BarSegment(value: Float(arc4random()), color: UIColor.redColor()))
            chart.addSegment(BarSegment(value: Float(arc4random()), color: UIColor.blueColor()))
            chart.addSegment(BarSegment(EmptySegmentWithvalue: Float(arc4random())))
            chart.draw()
            cell.addSubview(chart)
        } else if indexPath.row == 2 {
            label.text = "Sorted Chart"
            let chart = StackedBarChart(frame: CGRectMake(16, cell.frame.height - 16, cell.frame.width - 8 - 16, 2))
            chart.addSegment(BarSegment(value: Float(arc4random()), color: UIColor.redColor()))
            chart.addSegment(BarSegment(value: Float(arc4random()), color: UIColor.blueColor()))
            chart.addSegment(BarSegment(value: Float(arc4random()), color: UIColor.greenColor()))
            chart.drawSorted()
            cell.addSubview(chart)
        } else if indexPath.row == 3 {
            label.text = "Sorted Chart with Empty Segment"
            let chart = StackedBarChart(frame: CGRectMake(16, cell.frame.height - 16, cell.frame.width - 8 - 16, 2))
            chart.addSegment(BarSegment(value: Float(arc4random()), color: UIColor.redColor()))
            chart.addSegment(BarSegment(value: Float(arc4random()), color: UIColor.blueColor()))
            chart.addSegment(BarSegment(EmptySegmentWithvalue: Float(arc4random())))
            chart.drawSorted()
            cell.addSubview(chart)
        } else if indexPath.row == 4 {
            label.text = "Chart with forced Height"
            let chart = StackedBarChart(frame: CGRectMake(16, cell.frame.height - 16 - 10, cell.frame.width - 8 - 16, 10), forceHeight: true)
            chart.addSegment(BarSegment(value: Float(arc4random()), color: UIColor.redColor()))
            chart.addSegment(BarSegment(value: Float(arc4random()), color: UIColor.blueColor()))
            chart.addSegment(BarSegment(value: Float(arc4random()), color: UIColor.greenColor()))
            chart.draw()
            cell.addSubview(chart)
        }
        cell.addSubview(label)
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
