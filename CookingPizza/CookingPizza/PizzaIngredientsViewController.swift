//
//  PizzaIngredientsViewController.swift
//  CookingPizza
//
//  Created by JUAN ANDRÉS CÁRDENAS DIAZ on 21/02/16.
//  Copyright © 2016 JUAN ANDRÉS CÁRDENAS DIAZ. All rights reserved.
//

import UIKit

class PizzaIngredientsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
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
    
    let defaults = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let storagedIngredientsIndex = defaults.stringArrayForKey("selected-ingredients-index")
        
        if storagedIngredientsIndex != nil {
            
            self.selectedIngredients = storagedIngredientsIndex!
        }
        
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
        return pizzaIngredients.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("IngredienteCell", forIndexPath: indexPath)
        cell.textLabel?.text = pizzaIngredients[indexPath.row]
        
        cell.tintColor = UIColor.whiteColor()
        
        if isIngredientSelected(pizzaIngredients[indexPath.row]) {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
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
        
        defaults.setValue(selectedIngredients, forKey: "selected-ingredients-index")
        
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
