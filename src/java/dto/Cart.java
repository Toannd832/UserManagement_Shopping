/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import java.util.HashMap;
import java.util.Map;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author toan0
 */
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Cart {
    
 private Map<Integer, ProductOrder>Cart;
    
   public void add(ProductOrder ProductOrder){
       if(this.Cart == null){
           this.Cart = new HashMap<>();
       }
      Cart.put(ProductOrder.getProductid(), ProductOrder);
   }
}
