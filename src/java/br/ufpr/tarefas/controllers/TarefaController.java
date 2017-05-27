/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tarefas.controllers;

import br.ufpr.tarefas.dao.JdbcTarefaDao;
import br.ufpr.tarefas.model.Tarefa;
import java.util.List;
import javax.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author ufpr
 */
@Controller
public class TarefaController {
    
    @RequestMapping("/novaTarefa")
    public String form(){
        return "tarefa/formulario";
    }
    
    @RequestMapping("/adicionaTarefa")
    public String adicionar(@Valid Tarefa tarefa, BindingResult result){
        
        if (result.hasErrors()){
            return "tarefa/formulario";
        }
        
        JdbcTarefaDao dao = new JdbcTarefaDao();
        dao.adiciona(tarefa);
        return "tarefa/adicionada";
    }
    
    @RequestMapping("/listaTarefas")
    public String listar(Model model) {
        JdbcTarefaDao dao = new JdbcTarefaDao();
        List<Tarefa> tarefas = dao.getLista();
        model.addAttribute("tarefas",tarefas);
        return "tarefa/lista";
    }
    
    @RequestMapping("/removeTarefa")
    public String remover(Tarefa tarefa) {
        JdbcTarefaDao dao = new JdbcTarefaDao();
        dao.remove(tarefa);
        return "redirect:listaTarefas";
    }
    
}
