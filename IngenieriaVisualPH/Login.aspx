<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="IngenieriaVisualPH.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Login</title>
    <link rel="icon" href="Diseño/Imagenes/logo.ico"/>
    <link href="Diseño/bootstrap-5.0.1-dist/bootstrap-5.0.1-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Diseño/bootstrap-5.0.1-dist/bootstrap-5.0.1-dist/css/bootstrap.css" rel="stylesheet" />
    <link href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css" type="text/css" rel="stylesheet"/>
    <link href="Diseño/assets/css/flag-icon.min.css" rel="stylesheet" />
    <link href="Diseño/Color.css" rel="stylesheet" />
    <link href="Diseño/Login.css" rel="stylesheet" />
<script src="https://cdn.onesignal.com/sdks/OneSignalSDK.js" async=""></script>
<script>
  window.OneSignal = window.OneSignal || [];
  OneSignal.push(function() {
    OneSignal.init({
      appId: "e65775c9-85b6-4077-b9bb-7fab825b343d",
    });
  });
</script>
</head>
<body class="text-center bgcolor">
    <div class="container">
       <div class="card-body border border-3 border-secondary" style="border-radius:7px; border-color:#E74C3C">
        <form id="form" class="form-signin" runat="server">
                <div>
                    <img class="bordercolorinfo" src="Diseño/Imagenes/logo.png" style="border-radius:25px; border-color:#E74C3C" alt="" width="140" height="140" />
                </div>
                    <asp:DropDownList ID="ddestado" visible="false" runat="server" Font-Bold="true" CssClass="form-control text-success border-success">
                        <asp:ListItem>Propietario</asp:ListItem>
                    </asp:DropDownList><%--&nbsp;&nbsp;&nbsp;--%>
                <br />
                <div class="row">
                    <asp:TextBox runat="server" ID="txtcod1" type="torre" CssClass="form-control bordercolorinfo" ValidateRequestMode="Enabled" Visible="True" placeholder="Ingrese torre y apartamento" TextMode="Number"></asp:TextBox>
                </div>
                <br />
                <div class="row">
                    <asp:TextBox runat="server" ID="txtcontraseña" type="contraseña" CssClass="form-control bordercolorinfo" placeholder="Ingrese Contraseña" ValidateRequestMode="Enabled" TextMode="Password"></asp:TextBox>
                </div>
                <asp:Button runat="server" Text="Iniciar Sesion" Font-Bold="true" class="btn btn-lg btncolorinfo border-light" type="submit" OnClick="Unnamed_Click" />
                <div class="alert alert-danger" id="error" runat="server" style="margin-top: 10px; display: none">
                    <strong>Tu usuario o contraseña son incorrectos!</strong>
                </div>
                <h1></h1>
                <i class="menu-icon fa fa-phone"></i><a href="tel:3017285549" class="text-dark" >Tel Porteria</a>
                <h1></h1>
                <i class="fa fa-youtube-play"></i><a href="https://youtu.be/4UCUWAJ86iw" class="text-light">Click Aqui si es la primera vez que ingresa</a>
                <h1></h1>
                <i class="menu-icon fa fa-comments-o"></i><a href="https://api.whatsapp.com/send?phone=573002435992&fbclid=IwAR0B0J1W5ikmkzLArvAjBjw2kva7ZQnic9FtHSTutgSyRDRiuMIIUrhqVFo" class="text-light">Click Aqui soporte tecnico</a>
                <h1></h1>
                <i class="menu-icon fa fa-lock"><asp:LinkButton ID="LinkButton1" runat="server" CssClass="text-dark" Font-Bold="true" OnClick="LinkButton1_Click" >¿Olvido su Contraseña?</asp:LinkButton></i>
                <h1></h1>
        </form>
     </div>
        </div>
    </body>
<script src="Diseño/bootstrap-5.0.1-dist/bootstrap-5.0.1-dist/js/bootstrap.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js" type="text/javascript"></script>
<script src="Diseño/Onsignal.js" type="text/javascript"></script>
</html>

