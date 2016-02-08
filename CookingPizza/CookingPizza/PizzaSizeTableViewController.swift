//
//  PizzaSizeTableViewController.swift
//  CookingPizza
//
//  Created by JUAN ANDRÉS CÁRDENAS DIAZ on 7/02/16.
//  Copyright © 2016 JUAN ANDRÉS CÁRDENAS DIAZ. All rights reserved.
//

import UIKit

class PizzaSizeTableViewController: UITableViewController {
    
    var pizzaSizes:[String] = [
        "Pequeña", "Mediana", "Grande"]
    
    var selectedSize:String? {
        didSet {
            if let pizzaSize = selectedSize {
                selectedSizeIndex = pizzaSizes.indexOf(pizzaSize)!
            }
        }
    }
    
    var selectedSizeIndex:Int?

    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pizzaSizes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("SizeCell", forIndexPath: indexPath)
        cell.textLabel?.text = pizzaSizes[indexPath.row]
        
        if indexPath.row == selectedSizeIndex {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        //Other row is selected - need to deselect it
        if let index = selectedSizeIndex {
            let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: index, inSection: 0))
            cell?.accessoryType = .None
        }
        
        selectedSize = pizzaSizes[indexPath.row]
        
        //update the checkmark for the current row
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.accessoryType = .Checkmark
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if selectedSize != nil{
            let pizzaDoughTVC = segue.destinationViewController as! PizzaDoughTableViewController
            pizzaDoughTVC.pizzaSize = self.selectedSize!
        }
    }
    
    
    

}
