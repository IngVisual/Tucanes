<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="IngenieriaVisualPH.Registro.ResetPassword" %>

<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Reset Contrseña</title>
    <meta name="description" content="Sufee Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="apple-touch-icon" href="../Diseño/apple-icon.png">
    <link rel="shortcut icon" href="../Diseño/favicon.ico">
    <link rel="stylesheet" href="../Diseño/assets/css/normalize.css">
    <link rel="stylesheet" href="../Diseño/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../Diseño/assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="../Diseño/assets/css/themify-icons.css">
    <link rel="stylesheet" href="../Diseño/assets/css/flag-icon.min.css">
    <link rel="stylesheet" href="../Diseño/assets/css/cs-skin-elastic.css">
    <!-- <link rel="stylesheet" href="assets/css/bootstrap-select.less"> -->
    <link rel="stylesheet" href="../Diseño/assets/scss/style.css">
<%--    <link href="../Diseño/Login.css" rel="stylesheet" />--%>
    <link href="../Diseño/Login.css" rel="stylesheet" />
    <link href="../Diseño/Color.css" rel="stylesheet" />
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
     <link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
</head>
<body>
    <form id="form1" runat="server">

        <div class="alert alert-success" id="error" runat="server" style="margin-top: 10px; display: none">
            <strong>Por favor revise el email que enviamos al correo electronico registrado.</strong>
        </div>
        <div class="alert alert-danger" id="error1" runat="server" style="margin-top: 10px; display: none">
            <strong>No se encontro el usuario, Por favor vaya al link de soporte tecnico o intentelo nuevamente</strong>
        </div>
        <tr>
            <td colspan="2">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" class="text-danger" Font-Bold="true" />
            </td>
        </tr>
        <div class="container">
            <div class="form-signin">
                <div class="card card-body bordercolorinfo">
                    <div class="form-group">
                        <label class=" form-control-label textocolorinfo font-weight-bold">Recuperar Contraseña</label>
                        <div class="input-group">
                            <div class="input-group-addon"><i class="fa fa-user"></i></div>
                            <asp:TextBox ID="txtuser" runat="server" Placeholder="torre y apartamento" Text="" CssClass="form-control" TextMode="Number"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatoremail" runat="server" Display="Dynamic"
                                ErrorMessage="Ingrese como usuario su Torre y Apartamento sin espacios" ControlToValidate="txtuser" Text="*">
                            </asp:RequiredFieldValidator>
                        </div>
                        <br>
                     <asp:Button ID="btnactualizar" runat="server" Font-Bold="true" class="btn btn-lg btncolorinfo border border-dark" Text="Actualizar" OnClick="btnactualizar_Click" />
                    </div>                    
                </div>
            </div>
        </div>
    </form>
</body>
                 <!-- Left Panel -->
    <script src="../Diseñoassets/js/vendor/jquery-2.1.4.min.js"></script>
    <script src="../Diseñoassets/js/popper.min.js"></script>
    <script src="../Diseñoassets/js/plugins.js"></script>
    <script src="../Diseñoassets/js/main.js"></script>
</html>
