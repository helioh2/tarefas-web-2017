/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tarefas.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author ufpr
 */
@Controller
public class OlaMundoController {
    
    @RequestMapping("/olaMundo")
    public String digaOla(){
        System.out.println("Primeiro controller!!");
        return "ola";
    }
    
}
