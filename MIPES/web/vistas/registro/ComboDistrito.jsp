<%@page import="com.upeu.mipes.dao.DistritomDAO"%>
<%@page import="java.sql.ResultSet"%>
<% String dis = request.getParameter("n_distrito");%>
<select name="n_escuela">
    <option value="" disabled selected >Elegir Escuela Sabática</option>
    <%
        String sql = "SELECT  escuela.idescuela ,escuela.nombre  FROM distritom , escuela  where distritom.Nombre = '"+dis+"' and escuela.idDISTRITOM = distritom.idDISTRITOM";
        ResultSet rs=DistritomDAO.listaDistritos(sql) ;
        while (rs.next()) {%>
    <option value="<%= rs.getString("idESCUELA")%>"><%= rs.getString("NOMBRE")%></option>

    <% }
    %>
</select>