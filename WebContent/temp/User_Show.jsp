<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Java Reskill System----User Info</title>
<link rel="stylesheet" type="text/css" href="../Css/mystyle.css">
</head>
<body>
<!----------comn------------------>
<nav id="comn">
     <section>
         <h1>AFLAC</h1>        
     </section>
</nav>

<!----------comn2-----welcome------------->
<nav id="comn2">
     <section>
         <p>&nbsp;&nbsp;Welcome to Aflac Learning System !</p>        
     </section>
</nav>

    <hr />

    <div class="text_l"><img src="../Img/sub_title.gif" width="10" height="14" align="absmiddle" style="margin-right:5px">Search
        Conditions</div>
    <div class="text">&nbsp;</div>
    <form name="usercheck" method="post" action="User_Search" >
    <table cellpadding="0" cellspacing="0" border="0">
        <tbody><tr>
            <td>
                <table cellpadding="4" cellspacing="1" border="0" width="539" class="table_border">
                    <tbody><tr>
                        <td width="125" height="10" align="right" class="bgcolor_yellow2">User ID</td>
                        <td align="left"><input name="test_userid" value ="${id}" type="text" onfocus="this.style.backgroundColor='#FEFCD8'" onblur="this.style.backgroundColor='#FFFFFF'" maxlength="6" size="40" style="background-color: rgb(255, 255, 255);"></td>
                    </tr>

                    </tbody></table>
            </td>
        </tr>
        </tbody></table>
    <table cellpadding="0" cellspacing="0" border="0" width="50%">
       	<tr>
            <td align="center">
                <input type="submit" value=" Search "
					class="form_bt_px16"
					align="absmiddle"> </td>
        </tr>
    
    </table>
    </form>
			<c:if test="${requestScope.msg != null }">
			 	<font size=4 color="red">${requestScope.msg}</font>
			
			</c:if>

<p></p>
<hr align="left" size="1" class="bgcolor_gray2" width="80%">
<p></p>



<table border="0" cellpadding="3" cellspacing="1" width="90%">
    <tbody><tr>
        <td align="left">
            <div class="text_l"><img src="../Img/sub_title.gif" width="10" height="14" align="absmiddle" style="margin-right:5px">Information</div>
        </td>

    </tr>

    </tbody></table>

<table>
    <tbody>
    <tr>
        <td width="125" height="10" align="left" class="bgcolor_yellow2">User ID : </td>
        <td align="left">${requestScope.id }</td>
    </tr>
    <tr>
        <td width="125" height="10" align="left" class="bgcolor_yellow2">Name : </td>
        <td align="left">${requestScope.name }</td>
    </tr>

    </tbody>
</table>

<p></p>

<table border="0" cellpadding="3" cellspacing="1" width="90%">
    <tbody><tr>
        <td align="left">
            <div class="text_l"><img src="../Img/sub_title.gif" width="10" height="14" align="absmiddle" style="margin-right:5px">Add New Record</div>
        </td>

    </tr>

    </tbody></table>


<form name=add method="post" action="Result_Add.jsp" >
<table cellpadding="0" cellspacing="0" border="0" width="50%">
    <tr>
       	<tr>
            <input type="hidden" name="id" type="text" value ="${requestScope.id }">
            <input type="hidden" name="name" type="text" value ="${requestScope.name }">
        </tr>
          <input type="submit" value=" Add " class="form_bt_px16"
                 align="absmiddle" >
    </tr>
</table>
</form>

	<script src="../JS/button_check.js"></script>
	
<ul id="new1" >
	  <li><a href="../index.html">home</a></li>
	  <li><a href="../Pages/LOGIN.jsp">login</a></li>
	  <li><a href="../Pages/navigation.html">menu</a></li>
	  <li><a href="../Pages/about.html">about</a></li>
</ul>
</body>
</html>