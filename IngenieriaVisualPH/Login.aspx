<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="IngenieriaVisualPH.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Login</title>
    <link rel="icon" href="Diseño/Imagenes/logo.ico" />
    <link href="Diseño/bootstrap-5.0.1-dist/bootstrap-5.0.1-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Diseño/bootstrap-5.0.1-dist/bootstrap-5.0.1-dist/css/bootstrap.css" rel="stylesheet" />
    <link href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
    <link href="Diseño/assets/css/flag-icon.min.css" rel="stylesheet" />
    <link href="Diseño/Color.css" rel="stylesheet" />
    <link href="Diseño/Login.css" rel="stylesheet" />
    <link href="manifest.json" rel="manifest" />
    <link rel="apple-touch-icon" sizes="36x36" href="Diseño/Imagenes/logo36.png" />
    <link rel="apple-touch-icon" sizes="48x48" href="Diseño/Imagenes/logo48.png" />
    <link rel="apple-touch-icon" sizes="72x72" href="Diseño/Imagenes/logo72.png" />
    <link rel="apple-touch-icon" sizes="96x96" href="Diseño/Imagenes/logo96.png" />
    <link rel="apple-touch-icon" sizes="144x144" href="Diseño/Imagenes/logo144.png" />
    <link rel="apple-touch-icon" sizes="192x192" href="Diseño/Imagenes/logo192.png" />
    <link rel="apple-touch-icon" sizes="256x256" href="Diseño/Imagenes/logo256.png" />
    <link rel="apple-touch-icon" sizes="384x384" href="Diseño/Imagenes/logo384.png" />
    <link rel="apple-touch-icon" sizes="512x512" href="Diseño/Imagenes/logo512.png" />
    <script src="service-worker.js"></script>
    <script>
        if ('serviceWorker' in navigator && 'PushManager' in window) {
            window.addEventListener('beforeinstallprompt', (e) => {
                e.preventDefault();

                const deferredPrompt = e;

                const installButton = document.createElement('button');
                installButton.textContent = 'Instalar App Web';
                installButton.style.position = 'fixed';
                installButton.style.top = '10px';
                installButton.style.left = '50%';
                installButton.style.transform = 'translateX(-50%)';
                installButton.style.zIndex = '9999';
                installButton.style.padding = '10px 20px';
                installButton.classList.add('btn-grad');
                installButton.style.color = 'white';
                installButton.style.border = 'none';
                installButton.style.borderRadius = '5px';
                installButton.style.cursor = 'pointer';
                installButton.style.backgroundColor = '#424949';

                installButton.addEventListener('click', () => {

                    deferredPrompt.prompt();

                    deferredPrompt.userChoice.then(choiceResult => {
                        if (choiceResult.outcome === 'accepted') {
                            console.log('App instalada');
                        } else {
                            console.log('No fue posible la instalacion, comunicate con soporte.');
                        }

                        installButton.style.display = 'none';
                    });
                });

                document.body.appendChild(installButton);
            });
        }
    </script>
    <script src="https://cdn.onesignal.com/sdks/OneSignalSDK.js" async=""></script>
    <script>
        window.OneSignal = window.OneSignal || [];
        OneSignal.push(function () {
            OneSignal.init({
                appId: "e65775c9-85b6-4077-b9bb-7fab825b343d",
            });
        });
    </script>
</head>
<body class="text-center bgcolor">
    <div class="container">
        <div class="card-body border border-3 border-secondary" style="border-radius: 7px; border-color: #E74C3C">
            <form id="form" class="form-signin" runat="server">
                <div>
                    <img class="bordercolorinfo" src="Diseño/Imagenes/logo.png" style="border-radius: 25px; border-color: #E74C3C" alt="" width="140" height="140" />
                </div>
                <div class="col-xs-3">
                   <%-- <a href="https://votacionesph.somee.com/">
                        <button id="btn" type="button" style="border-radius: 7px; background-color: #3498DB; color: white; border: 2px solid white; font-weight: bold;" class="form-control animate__animated animate__pulse animate__infinite animate__delay-2s">
                            <i class="fa fa-hand-o-right"></i>&nbsp;Pulse Aquí para Ingresar a la Aplicación de Encuesta
                        </button>
                    </a>--%>
                <%--    <div style="margin-top: 10px; padding: 10px; background-color: #f0f0f0; border: 1px solid #ccc; border-radius: 5px; font-size: 16px; text-align: center;">
                        Para ingresar, utiliza el mismo Usuario y Contraseña que empleas en la aplicación de Tucanes.<br>
                        <br>
                        <strong>IMPORTANTE:</strong><br>
                        Si tu contraseña tiene letras, no podrás ingresar. Debes solicitarla en el botón "Soporte Técnico" en la parte inferior.
                    </div>--%>
                </div>
                <asp:DropDownList ID="ddestado" Visible="false" runat="server" Font-Bold="true" CssClass="form-control text-success border-success">
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
                <i class="menu-icon fa fa-phone"></i><a href="tel:3017285549" class="text-dark">Tel Porteria</a>
                <h1></h1>
                <i class="fa fa-youtube-play"></i><a href="https://youtube.com/shorts/JDUD4s5hRDE?feature=share" class="text-light">Click Aqui si es la primera vez que ingresa</a>
                <h1></h1>
                <i class="menu-icon fa fa-comments-o"></i><a href="https://api.whatsapp.com/send?phone=573044298479&fbclid=IwAR0B0J1W5ikmkzLArvAjBjw2kva7ZQnic9FtHSTutgSyRDRiuMIIUrhqVFo" class="text-light">Click Aqui soporte tecnico</a>
                <h1></h1>
                <i class="menu-icon fa fa-lock">
                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="text-dark" Font-Bold="true" OnClick="LinkButton1_Click">¿Olvido su Contraseña?</asp:LinkButton></i>
                <h1></h1>
            </form>
        </div>
    </div>
</body>
<script src="Diseño/bootstrap-5.0.1-dist/bootstrap-5.0.1-dist/js/bootstrap.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js" type="text/javascript"></script>
<script src="Diseño/Onsignal.js" type="text/javascript"></script>
</html>

