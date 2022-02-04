<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@ include file = "validaSessao.jsp"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>.: Intranet Acadêmica - Universidade Federal do Paraná :.</title>
</head>


<frameset rows="*" cols="183,*" frameborder="no" border="0" framespacing="0">
	<frameset rows="129,*" cols="*" framespacing="0" frameborder="no" border="0">
		<frame src="frame_logo.htm" name="frame_logo" scrolling="No" noresize="noresize" id="frame_logo" title="frame_logo" />
		<frameset rows="66,*" cols="*" framespacing="0" frameborder="no" border="0">
			<frame src="frame_login.jsp" name="frame_login" scrolling="No" noresize="noresize" id="frame_login" title="frame_login" />
		<frame src="frame_menu_departamento.htm" name="frame_menu" scrolling="No" noresize="noresize" id="frame_menu" title="frame_menu" />
	</frameset>
	</frameset>
	<frameset rows="129,*" cols="*" framespacing="0" frameborder="no" border="0">
		<frameset rows="*" cols="*,263" framespacing="0" frameborder="no" border="0">
		<frame src="frame_top.htm" name="frame_top" scrolling="No" noresize="noresize" id="frame_top" title="frame_top_dir" />
		<frame src="frame_top_dir.htm" name="frame_top_dir" scrolling="No" noresize="noresize" id="frame_top_dir" title="rightFrame" />
	</frameset>
		<frameset rows="66,*" cols="*" framespacing="0" frameborder="no" border="0">
			<frameset rows="*" cols="*,263" framespacing="0" frameborder="no" border="0">
		<frame src="frame_menusup.htm" name="frame_menusup" scrolling="No" noresize="noresize" id="frame_menusup" title="frame_menusup_dir" />
		<frame src="frame_menusup_dir.htm" name="frame_menusup_dir" scrolling="No" noresize="noresize" id="frame_menusup_dir" title="rightFrame1" />
	</frameset>
		<frameset rows="*" cols="*,263" framespacing="0" frameborder="no" border="0">
		<frame src="inicial.jsp" name="frame_main" id="frame_main" title="frame_main_dir" />
		<frame src="frame_main_dir.html" name="frame_main_dir" scrolling="No" noresize="noresize" id="frame_main_dir" title="rightFrame2" />
	</frameset>
	</frameset>
	</frameset>
</frameset>
<noframes>

</body>
<label>
<input type="file" name="file" />
</label>
</noframes></html>
