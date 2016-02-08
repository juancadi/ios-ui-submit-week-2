//
//  PizzaOrderViewController.swift
//  CookingPizza
//
//  Created by JUAN ANDRÉS CÁRDENAS DIAZ on 8/02/16.
//  Copyright © 2016 JUAN ANDRÉS CÁRDENAS DIAZ. All rights reserved.
//

import UIKit

class PizzaOrderViewController: UIViewController {
    
    
    
    @IBOutlet weak var lblPizzaSize: UILabel!
    
    @IBOutlet weak var lblPizzaDough: UILabel!
    
    @IBOutlet weak var lblPizzaCheese: UILabel!
    
    @IBOutlet weak var lblPizzaIngredients: UILabel!

    
    var pizzaSize = "Sin seleccionar..."
    var pizzaDough = "Sin seleccionar..."
    var pizzaCheese = "Sin seleccionar..."
    var pizzaIngredients : [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lblPizzaSize.text = pizzaSize
        lblPizzaDough.text = pizzaDough
        lblPizzaCheese.text = pizzaCheese
        
        var ingredients = "Sin seleccionar..."
        
        if pizzaIngredients.count > 0{
            
            ingredients = ""
        
            for ingredient in pizzaIngredients{
            
            ingredients += ingredient + " "
            
            }
        
        }
        
        
        lblPizzaIngredients.text = ingredients
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
