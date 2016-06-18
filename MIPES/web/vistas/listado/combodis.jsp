<jsp:useBean class="com.upeu.mipes.dao.EscuelaDAO" id="es" scope="page" ></jsp:useBean>

<%@page import="java.sql.ResultSet"%>
<% String dis = request.getParameter("n_distrito");
%>
<% String sql = "SELECT * FROM escuela where iddistritom = " + dis + " and estado =1 order by nombre";
        ResultSet rs = es.listar_escuelas(sql); %>
<select class="form-control" id="ies" name="n_escuela" onchange="listgp()">
    <option value="" disabled selected >Elegir Escuela Sabática</option>
    <%while (rs.next()) {%>
    <option value="<%= rs.getString("idESCUELA")%>"><%= rs.getString("NOMBRE")%></option>
    <% }%>
</select>
