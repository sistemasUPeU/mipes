<jsp:useBean class="com.upeu.mipes.dao.EscuelaDAO" id="es" scope="page" ></jsp:useBean>
<jsp:include page="../../jspf/impmaterialize.jspf"></jsp:include>
<%@page import="java.sql.ResultSet"%>
<% String dis = request.getParameter("n_distrito");
%>
<div id="iescuela" class="input-field col s12" style="margin-top: 0;padding: 0;">
    <% String sql = "SELECT * FROM escuela where iddistritom = " + dis + " and estado =1 order by nombre";
        ResultSet rs = es.listar_escuelas(sql); %>
    <select name="n_escuela" id="escuela">
        <option value="" disabled selected >Elegir Escuela Sabática</option>
        <%while (rs.next()) {%>
        <option value="<%= rs.getString("idESCUELA")%>"><%= rs.getString("NOMBRE")%></option>
        <% }%>
    </select>
    <label>Escuela Sabática</label>
    <script>
        $("#escuela").material_select();
    </script>
</div>
