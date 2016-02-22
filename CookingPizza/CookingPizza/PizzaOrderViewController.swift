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
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    
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
            
            ingredients += ingredient + "\n"
            
            }
        
        }
        
        
        lblPizzaIngredients.text = ingredients
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func orderPizza(sender: AnyObject) {
        
        
        if lblPizzaSize.text == "Sin seleccionar..." || lblPizzaDough.text == "Sin seleccionar..." || lblPizzaCheese.text == "Sin seleccionar..." || lblPizzaCheese.text == "Sin seleccionar..." {
        
            let alert = UIAlertController(title: "Upsss!", message: "En alguno de los pasos olvidaste seleccionar al menos una opción, por favor regresa y completa tu orden correctamente!", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
        }else{
            
            defaults.setInteger(0, forKey: "selected-size-index")
            defaults.setInteger(0, forKey: "selected-dough-index")
            defaults.setInteger(0, forKey: "selected-cheese-index")
            defaults.setValue([String](), forKey: "selected-ingredients-index")
            
            let alert = UIAlertController(title: "", message: "Tu orden fue enviada a nuestro chef y en unos minutos podrás disfrutar de una pizza preparada a tu gusto...", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Default, handler: {(action:UIAlertAction!) in
                
                let vc = self.storyboard!.instantiateViewControllerWithIdentifier("MenuViewController") as! PizzaMenuViewController
                self.presentViewController(vc, animated: true, completion: nil)
                
            }))
            
            self.presentViewController(alert, animated: true, completion: nil)
            //llamar pantalla inicial!
            
            
        }
        
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
