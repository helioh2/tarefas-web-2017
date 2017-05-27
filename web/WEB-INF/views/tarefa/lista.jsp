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
      <tr>
          <td>${tarefa.id}</td>
          <td>${tarefa.descricao}</td>
          <td>
              <c:if test="${tarefa.finalizado eq false}">
                  Não
              </c:if>
              <c:if test="${tarefa.finalizado eq true}">
                  Sim
              </c:if>
                  
          </td>
          <td>${tarefa.dataFinalizacao.time}</td>
          <td><a href="removeTarefa?id=${tarefa.id}">Remover</a>
      </tr>
  </c:forEach>
   </table>

        
    </body>
</html>
