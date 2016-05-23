<jsp:useBean class="com.upeu.mipes.config.Conexion" id="cn" scope="page"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<% String dis = request.getParameter("n_distrito");
    String s_opc = request.getParameter("f_opc");
    if (s_opc.equals("1")) {
%>
<select name="n_escuela">
    <option value="" disabled selected >Elegir Escuela Sabática</option>
    <%
        String sql = "SELECT  escuela.idescuela ,escuela.nombre  FROM distritom , escuela  where distritom.iddistritom = '" + dis + "' and escuela.idDISTRITOM = distritom.idDISTRITOM";
        ResultSet rs = cn.RecibirDatos(sql);
        while (rs.next()) {%>
    <option value="<%= rs.getString("idESCUELA")%>"><%= rs.getString("NOMBRE")%></option>

    <% }
        cn.cerrar();
    %>
</select>
<%  }
%>