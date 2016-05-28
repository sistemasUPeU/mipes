<jsp:useBean class="com.upeu.mipes.dao.EscuelaDAO" id="es" scope="page" ></jsp:useBean>
    <script src="../../js/jquery-2.2.3.min.js" type="text/javascript"></script>
    <script src="../../js/md5.js" type="text/javascript"></script>
    <script src="../../js/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="../../js/materialize.js" type="text/javascript"></script>
    <script src="../../js/materialize.min.js" type="text/javascript"></script>
    <link href="../../css/materialize.min.css" rel="stylesheet" type="text/css"/>
    <link href="../../css/materialize.css" rel="stylesheet" type="text/css"/>

<%@page import="java.sql.ResultSet"%>
<% String dis = request.getParameter("n_distrito");
%>
<div id="iescuela" class="input-field col s12" style="margin-top: 2%;">
    <% String sql = "SELECT * FROM escuela where iddistritom = " + dis + " and estado =1 order by nombre";
        ResultSet rs = es.listar_escuelas(sql); %>


    <select name="n_escuela" id="escuela">
        <option value="" disabled selected >Elegir Escuela Sabática</option>
        <%while (rs.next()) {%>
        <option value="<%= rs.getString("idESCUELA")%>"><%= rs.getString("NOMBRE")%></option>
        <% }%>
    </select>


    <script>
        $("#escuela").material_select();
    </script>   
</div>