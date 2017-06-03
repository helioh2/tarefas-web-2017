<%-- 
    Document   : lista
    Created on : 26/05/2017, 22:19:21
    Author     : ufpr
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://code.jquery.com/jquery-2.2.3.js" integrity="sha256-laXWtGydpwqJ8JA+X9x2miwmaiKhn8tVmOVEigRNtP4=" crossorigin="anonymous"></script>

    </head>
    <body>
        <table>
  <tr>
    <th>Id</th>
    <th>Descrição</th>
    <th>Finalizado?</th>
    <th>Data de finalização</th>
  </tr>
  <c:forEach var="tarefa" items="${tarefas}">
      <tr id="tarefa_${tarefa.id}">
          <td>${tarefa.id}</td>
          <td>${tarefa.descricao}</td>
          <td id="coluna_finalizado_${tarefa.id}">
              <c:if test="${tarefa.finalizado eq false}">
                  Não
              </c:if>
              <c:if test="${tarefa.finalizado eq true}">
                  Sim
              </c:if>
                  
          </td>
          <td id "data_finalizado_${tarefa.id}"><fmt:formatDate 
      value="${tarefa.dataFinalizacao.time}" 
      pattern="dd/MM/yyyy" /></td>
          <td><a href="removeTarefa?id=${tarefa.id}">Remover</a></td>
          <td>
              <c:if test="${tarefa.finalizado eq false}">
                  <a href="#" onclick="finalizaAgora(${tarefa.id})">Finalizar</a>
              </c:if>
          </td>  
      </tr>
  </c:forEach>
   </table>

        <script type="text/javascript">
            
//            function alertQuandoOk(dadosDeResposta) {
//                alert("Tarefa finalizada!");
//    }       }
            
            function finalizaAgora(id) {
                $.get("finalizaTarefa?id=" + id, function(dadosDeResposta) {
        //$("#coluna_finalizado_"+id).html("Sim");
        //$("data_finalizado_${tarefa.id}").html("Sim");
        //alert("Tarefa finalizada!");
        $("#tarefa_"+id).html(dadosDeResposta);
      });
            }
        </script>
        
    </body>
</html>
