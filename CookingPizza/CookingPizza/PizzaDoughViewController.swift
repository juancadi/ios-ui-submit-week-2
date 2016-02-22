//
//  PizzaDoughViewController.swift
//  CookingPizza
//
//  Created by JUAN ANDRÉS CÁRDENAS DIAZ on 21/02/16.
//  Copyright © 2016 JUAN ANDRÉS CÁRDENAS DIAZ. All rights reserved.
//

import UIKit

class PizzaDoughViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var pizzaSize = "Sin seleccionar..."
    
    var pizzaDoughs:[String] = [
        "Delgada", "Crujiente", "Gruesa"]
    
    var selectedDough:String? {
        didSet {
            if let pizzaDough = selectedDough {
                selectedDoughIndex = pizzaDoughs.indexOf(pizzaDough)!
            }
        }
    }
    
    var selectedDoughIndex:Int?
    
    let defaults = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let storagedDoughIndex = defaults.integerForKey("selected-dough-index")
        selectedDough = self.pizzaDoughs[storagedDoughIndex]
        
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
        return pizzaDoughs.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MasaCell", forIndexPath: indexPath)
        cell.textLabel?.text = pizzaDoughs[indexPath.row]
        
        cell.tintColor = UIColor.whiteColor()
        
        if indexPath.row == selectedDoughIndex {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        //Other row is selected - need to deselect it
        if let index = selectedDoughIndex {
            let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: index, inSection: 0))
            cell?.accessoryType = .None
        
        }
            selectedDough = pizzaDoughs[indexPath.row]
            defaults.setInteger(indexPath.row, forKey: "selected-dough-index")
        
        
        //update the checkmark for the current row
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.accessoryType = .Checkmark
    }

    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let pizzaCheeseVC = segue.destinationViewController as! PizzaCheeseViewController
        pizzaCheeseVC.pizzaSize = self.pizzaSize
        
        if selectedDough != nil{
            
            pizzaCheeseVC.pizzaDough = self.selectedDough!
            
        }
        
    }

}
