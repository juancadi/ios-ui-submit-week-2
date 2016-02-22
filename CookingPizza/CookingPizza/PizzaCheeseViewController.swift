//
//  CheeseViewController.swift
//  CookingPizza
//
//  Created by JUAN ANDRÉS CÁRDENAS DIAZ on 21/02/16.
//  Copyright © 2016 JUAN ANDRÉS CÁRDENAS DIAZ. All rights reserved.
//

import UIKit

class PizzaCheeseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var pizzaSize = "Sin seleccionar..."
    var pizzaDough = "Sin seleccionar..."
    
    
    var pizzaCheeses:[String] = [
        "Mozzarella", "Cheddar", "Parmesano", "Sin Queso"]
    
    var selectedCheese:String? {
        didSet {
            if let pizzaCheese = selectedCheese {
                selectedCheeseIndex = pizzaCheeses.indexOf(pizzaCheese)!
            }
        }
    }
    
    var selectedCheeseIndex:Int?
    
    let defaults = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let storagedCheeseIndex = defaults.integerForKey("selected-cheese-index")
        //self.selectedCheeseIndex = storagedCheeseIndex
        selectedCheese = self.pizzaCheeses[storagedCheeseIndex]
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
        return pizzaCheeses.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("QuesoCell", forIndexPath: indexPath)
        cell.textLabel?.text = pizzaCheeses[indexPath.row]
        
        cell.tintColor = UIColor.whiteColor()
        
        if indexPath.row == selectedCheeseIndex {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        //Other row is selected - need to deselect it
        if let index = selectedCheeseIndex {
            let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: index, inSection: 0))
            cell?.accessoryType = .None
        }
        
        selectedCheese = pizzaCheeses[indexPath.row]
        defaults.setInteger(indexPath.row, forKey: "selected-cheese-index")
        
        //update the checkmark for the current row
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.accessoryType = .Checkmark
    }
    

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let pizzaIngredientsVC = segue.destinationViewController as! PizzaIngredientsViewController
        pizzaIngredientsVC.pizzaSize = self.pizzaSize
        pizzaIngredientsVC.pizzaDough = self.pizzaDough
        
        if selectedCheese != nil{
            
            pizzaIngredientsVC.pizzaCheese = self.selectedCheese!
            
        }
        
    }

}
