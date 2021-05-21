
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Untitled Document</title>
        <style type="text/css">
            body {
                background-image: url(Gambar/background.jpg);
            }
            .halaman {
            }
            .menu {
                margin-bottom: 5px;
                margin-left: 5px;
                margin-top: 5px;
                width: 150px;
            }
        </style>
    </head>
    
    <body>
        <table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <th colspan="2" scope="col"><font face="Verdana, Geneva, sans-serif" size="1" color="#FFFFFF"> <b>
                            Sistem Perpustakaan Sederhana Berbasis Web</b></font></th>
            </tr>
            <tr>
                <td colspan="2" background="Gambar/header.png" width="900" height="99"/></td>
            </tr>
            <tr>
                <td width="150" valign="top" bgcolor="#FFFFFF"><div class="menu"><%@ include file="menu.jsp"%></div></td>
                <td width="750" height="525" align="left" valign="top" bgcolor="#FFFFFF"><div class="halaman"><%@ include file="halaman.jsp"%></div></td>
            </tr>
            <tr>
                <td colspan="3" width="900" height="15" align="center" valign="top" background="Gambar/footer.png">
                    <font face="Tahoma, Geneva, sans-serif" size="1" color="#000000"><b>Created : Ahmad Abi Mulya & Muhammad Fathurachman</b></font>
                </td>
            </tr>
        </table>
    </body>
            
            
</html>
                
                
                