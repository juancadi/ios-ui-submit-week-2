//
//  PizzaSizeViewController.swift
//  CookingPizza
//
//  Created by JUAN ANDRÉS CÁRDENAS DIAZ on 21/02/16.
//  Copyright © 2016 JUAN ANDRÉS CÁRDENAS DIAZ. All rights reserved.
//

import UIKit

class PizzaSizeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var selectedPizzaDough = "Sin seleccionar..."
    
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
    
    let defaults = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let storagedSizeIndex = defaults.integerForKey("selected-size-index")
        //self.selectedSizeIndex = storagedSizeIndex
        selectedSize = pizzaSizes[storagedSizeIndex]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        
    }
    
    
    override func viewDidAppear(animated: Bool) {
        
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.Black
        nav?.tintColor = UIColor.whiteColor()
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pizzaSizes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("SizeCellTest", forIndexPath: indexPath)
        cell.textLabel?.text = pizzaSizes[indexPath.row]
        
        cell.tintColor = UIColor.whiteColor()
        
        if indexPath.row == selectedSizeIndex {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        //Other row is selected - need to deselect it
        if let index = selectedSizeIndex {
            let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: index, inSection: 0))
            cell?.accessoryType = .None
        }
            
        selectedSize = pizzaSizes[indexPath.row]
        defaults.setInteger(indexPath.row, forKey: "selected-size-index")
            
        
        //update the checkmark for the current row
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.accessoryType = .Checkmark
    }

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        if selectedSize != nil{
            
            let pizzaDoughVC = segue.destinationViewController as! PizzaDoughViewController

            pizzaDoughVC.pizzaSize = self.selectedSize!
            
        }
        
    
    }
    

}
