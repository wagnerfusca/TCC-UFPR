<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page session="true" %>
<%@page import="javax.servlet.http.*"%>
<%@ include file = "validaSessao.jsp"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>.: Intranet Acadêmica - Universidade Federal do Paraná :.</title>
<script language="JavaScript">
if (screen.width==800||screen.height==600)
window.location.replace("index800.jsp")
else if (screen.width==1024||screen.height==768)
window.location.replace("index1024.jsp")
else if (screen.width>1024||screen.height>768)
window.location.replace("index1024.jsp")
</script>
</head>
</body>
</noframes>
</html>