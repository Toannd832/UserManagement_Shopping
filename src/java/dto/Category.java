/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

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
public class Category {
    private String cid;
    private String cname;
}
