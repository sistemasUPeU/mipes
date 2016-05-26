<jsp:useBean class="com.upeu.mipes.dao.GrupoDAO" id="gp" scope="page" ></jsp:useBean>
    <script src="../../js/jquery-2.2.3.min.js" type="text/javascript"></script>
    <script src="../../js/md5.js" type="text/javascript"></script>
    <script src="../../js/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="../../js/materialize.js" type="text/javascript"></script>
    <script src="../../js/materialize.min.js" type="text/javascript"></script>
    <link href="../../css/materialize.min.css" rel="stylesheet" type="text/css"/>
    <link href="../../css/materialize.css" rel="stylesheet" type="text/css"/>

<%@page import="java.sql.ResultSet"%>
<% String es = request.getParameter("n_escuela");
%>
<div id="igrupo" class="input-field col s12" style="margin-top: 2%;">
    <% String sql = "SELECT * FROM grupo where idescuela = " + es + " order by nombre";
        ResultSet rs = gp.listar_grupos(sql); %>


    <select name="n_grupo" id="grupo">
        <option value="" disabled selected >Elegir Grupo Pequeño</option>
        <%while (rs.next()) {%>
        <option value="<%= rs.getString("idGRUPO")%>"><%= rs.getString("NOMBRE")%></option>
        <% }%>
    </select>


    <script>
        $("#grupo").material_select();
    </script>   
</div>