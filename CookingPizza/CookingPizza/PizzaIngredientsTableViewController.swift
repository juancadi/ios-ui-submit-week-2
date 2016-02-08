//
//  PizzaIngredientsTableViewController.swift
//  CookingPizza
//
//  Created by JUAN ANDRÉS CÁRDENAS DIAZ on 8/02/16.
//  Copyright © 2016 JUAN ANDRÉS CÁRDENAS DIAZ. All rights reserved.
//

import UIKit

class PizzaIngredientsTableViewController: UITableViewController {
    
    var pizzaSize = "Sin seleccionar..."
    var pizzaDough = "Sin seleccionar..."
    var pizzaCheese = "Sin seleccionar..."

    var pizzaIngredients:[String] = [
        "Jamón", "Pepperoni", "Pavo", "Salami", "Aceitunas", "Cebolla", "Pimienta", "Piña", "Anchoas"]
    
    /*var selectedIngredient:String? {
        didSet {
            if let pizzaIngredient = selectedIngredient {
                selectedIngredientIndex = pizzaIngredients.indexOf(pizzaIngredient)!
            }
        }
    }*/
    
    var selectedIngredients:[String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pizzaIngredients.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("IngredientCell", forIndexPath: indexPath)
        cell.textLabel?.text = pizzaIngredients[indexPath.row]
        
        if isIngredientSelected(pizzaIngredients[indexPath.row]) {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if isIngredientSelected(pizzaIngredients[indexPath.row]){
            
            let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: indexPath.row, inSection: 0))
            cell?.accessoryType = .None
            removeIngredient(pizzaIngredients[indexPath.row])
        
        }else{
            
            if selectedIngredients.count < 5{
            
                let cell = tableView.cellForRowAtIndexPath(indexPath)
                cell?.accessoryType = .Checkmark
                addIngredient(pizzaIngredients[indexPath.row])
                
            }
        
        }
        
    }
    
    
    func isIngredientSelected(ingredient: String)-> Bool{
    
        var isSelected : Bool = false
        
        for selectedIngredient in selectedIngredients {
        
            if selectedIngredient == ingredient {
                
                isSelected = true
            
            }
        
        }
    
        return isSelected
    }
    
    func removeIngredient(ingredient : String){
    
        for var i=0; i<selectedIngredients.count; i++ {
            
            if selectedIngredients[i] == ingredient {
                
                selectedIngredients.removeAtIndex(i)
                
            }
            
        }
    
    
    }
    
    
    
    func addIngredient(ingredient : String){
    
        selectedIngredients.append(ingredient)
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
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
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let pizzaOrderVC = segue.destinationViewController as! PizzaOrderViewController
        pizzaOrderVC.pizzaSize = self.pizzaSize
        pizzaOrderVC.pizzaDough = self.pizzaDough
        pizzaOrderVC.pizzaCheese = self.pizzaCheese
        pizzaOrderVC.pizzaIngredients = self.selectedIngredients
        
       
        
    }

}
