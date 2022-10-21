<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistroCitofonia.aspx.cs" Inherits="IngenieriaVisualPH.Registro.RegistroCitofonia" %>

<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>RegistroCitofonia</title>
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
        <div>
            <div class="col-12">
                <div class="card bordercolorinfo">
                    <div class="card-body">
                        <div class="card-title">
                            <h3 class="text-center textocolorinfo font-weight-bold"><i class="fa fa-pencil animate__animated animate__shakeX animate__infinite animate__delay-2s"></i>Registro de Citofonia y Datos Generales<asp:Label ID="lblcodigo" runat="server" ForeColor="DarkGray"></asp:Label></h3>                          
                            <br />
                                <form id="fo2" runat="server" >                                   
                            <tr>
                                <td colspan="2">
                                    <div class="alert alert-danger" id="error" runat="server" style="margin-top: 10px; display: none">
                                        <strong>La sesion con su usuario ha finalizado. Por favor ingrese nuevamente</strong>
                                    </div>
                                </td>
                                <td colspan="2">
                                     <div class="alert alert-danger" id="error1" runat="server" style="margin-top: 10px; display: none">
                                        <strong>Ingrese los datos requeridos</strong>
                                    </div>
                                </td>
                                <td colspan="2">
                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-danger" Font-Bold="true" />
                                </td>
                            </tr>
                            <div>
                                <div class="form-group">
                                    <label class=" form-control-label textocolorinfo">CORREO ELECTRONICO</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-envelope-o"></i></div>
                                        <asp:TextBox ID="txtemail" runat="server" Text="" CssClass="form-control" TextMode="Email"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatoremail" runat="server" Display="Dynamic"
                                            ErrorMessage="El email es requerido" ControlToValidate="txtemail" Text="*">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label textocolorinfo">CELULAR 1 PROPIETARIOS<span class="badge badge-success pull-right">&nbsp;&nbsp(Se utilizara para citofonia)</span></label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-phone"></i></div>
                                        <asp:TextBox ID="txtcelular" runat="server" Text="" CssClass="form-control" TextMode="Number" MaxLength="10"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorcel" runat="server" Display="Dynamic"
                                            ErrorMessage="El celular1 del propietario es requerido" ControlToValidate="txtcelular" Text="*">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label textocolorinfo">CELULAR 2 PROPIETARIOS<span class="badge badge-success pull-right">&nbsp;&nbsp(Se utilizara para citofonia)</span></label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-phone"></i></div>
                                        <asp:TextBox ID="txtotrocelular" runat="server" Text="" CssClass="form-control" TextMode="Number" MaxLength="10"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label textocolorinfo">APARTAMENTO HABITADO POR:</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-users"></i></div>
                                        <asp:DropDownList ID="ddesatdo" CssClass="form-control" runat="server">
                                            <asp:ListItem></asp:ListItem>
                                            <asp:ListItem>Propietarios</asp:ListItem>
                                            <asp:ListItem>Arrendado</asp:ListItem>
                                            <asp:ListItem>Desocupado</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                                            ErrorMessage="El apartamento habitado por: es requerido" ControlToValidate="ddesatdo" Text="*">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label textocolorinfo">CELULAR ARRENDADO<span class="badge badge-success pull-right">&nbsp;&nbsp(Inquilino)(Se utilizara para citofonia)</span></label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-phone"></i></div>
                                        <asp:TextBox ID="txtcelarr" runat="server" Text="" CssClass="form-control" TextMode="Number" MaxLength="10"></asp:TextBox>
                                    </div>
                                </div>

                                <h3 class="textocolorinfo">CENSO RESIDENCIAL(Seguridad Ingreso de Porteria)</h3>
                                <br />
                                <div class="form-group">
                                    <label class=" form-control-label textocolorinfo">NUMERO DE ADULTOS QUE HABITAN:</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-users"></i></div>
                                        <asp:DropDownList ID="ddNpersonas" CssClass="form-control" runat="server">
                                            <asp:ListItem></asp:ListItem>
                                            <asp:ListItem>0</asp:ListItem>
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                            <asp:ListItem>5</asp:ListItem>
                                            <asp:ListItem>6</asp:ListItem>
                                            <asp:ListItem>7</asp:ListItem>
                                            <asp:ListItem>8</asp:ListItem>
                                            <asp:ListItem>9</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                                            ErrorMessage="Los Adultos que habitan es requerido, si no tienen ingrese 0" ControlToValidate="ddNpersonas" Text="*">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                    <label class=" form-control-label textocolorinfo">NOMBRES Y APELLIDOS DE LOS ADULTOS</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-check-square"></i></div>
                                        <asp:TextBox ID="txtnomadul" runat="server" Text="" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                 <div class="form-group">
                                    <label class=" form-control-label textocolorinfo">NUMERO DE MENORES DE EDAD QUE HABITAN:</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-users"></i></div>
                                        <asp:DropDownList ID="ddmenores" CssClass="form-control" runat="server">
                                            <asp:ListItem></asp:ListItem>
                                            <asp:ListItem>0</asp:ListItem>
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                            <asp:ListItem>5</asp:ListItem>
                                            <asp:ListItem>6</asp:ListItem>
                                            <asp:ListItem>7</asp:ListItem>
                                            <asp:ListItem>8</asp:ListItem>
                                            <asp:ListItem>9</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic"
                                            ErrorMessage="los menores que habitan es requerido, si no tienen ingrese 0" ControlToValidate="ddmenores" Text="*">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                     <label class=" form-control-label textocolorinfo">NOMBRES Y APELLIDOS DE LOS MENORES</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-check-square"></i></div>
                                        <asp:TextBox ID="txtmennom" runat="server" Text="" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label textocolorinfo">NUMERO DE MASCOTAS:</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-dot-circle-o"></i></div>
                                        <asp:DropDownList ID="ddmascotas" visible="True" CssClass="form-control" runat="server">
                                            <asp:ListItem></asp:ListItem>
                                            <asp:ListItem>0</asp:ListItem>
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                            <asp:ListItem>5</asp:ListItem>
                                            <asp:ListItem>6</asp:ListItem>
                                            <asp:ListItem>7</asp:ListItem>
                                            <asp:ListItem>8</asp:ListItem>
                                            <asp:ListItem>9</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic"
                                            ErrorMessage="El numero de mascotas es requerido, si no tienen ingrese 0" ControlToValidate="ddmascotas" Text="*">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label textocolorinfo">NOMBRE DE RAZAS</label>
                                     <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-check-square"></i></div>
                                        <asp:TextBox ID="txtrazas" runat="server" Text="" TextMode="MultiLine"  CssClass="form-control" ></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label textocolorinfo">INGRESE NOMBRE Y APELLIDO DE LAS PERSONAS QUE USTED LES PROHIBE INGRESO EN PORTERIA(Opcinal)</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-check-square"></i></div>
                                        <asp:TextBox ID="txtsanc" runat="server" Text="" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="alert alert-success" role="alert"><i class="fa fa-check">He leído las normas de convivencia y acepto los términos y condiciones como propietario</i></div>
                                    <i class="menu-icon fa fa-eye"></i><a href="PoliticaConvivencia.aspx" style="color: #37ac10">Leer politica de convivencia y proteccion de datos</a>
                                </div>
                                <div class="form-group">
                                    <div class="alert alert-danger" role="alert"><i class="fa fa-check">He leído y acepto los términos y condiciones</i></div>
                                    <asp:DropDownList ID="DropDownList1" runat="server" Visible="False">
                                        <asp:ListItem>Si</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:Label ID="lblconjunto" runat="server" Visible="false"></asp:Label>
                                    <asp:Label ID="lblmensaje1" runat="server" Visible="false"></asp:Label>
                                    <asp:Label ID="lblasunto" runat="server" Visible="false"></asp:Label>
                                    <i class="menu-icon fa fa-eye"></i><a href="PoliticaDatos.aspx" style="color: #dc3b3b">Ver Política Privacidad de Datos</a>
                                </div>                                                           
                                <asp:Button ID="btnactualizar" runat="server" Font-Bold="true" style="border-radius:7px" class="btn btn-lg btncolorinfo btn-block border border-dark" Text="Acepto Politicas Leídas" OnClick="btnactualizar_Click1" />
                            </div>
                           </form>
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                        </div>
                    </div>
                </div>
            </div>
        </div>
</body>
         <!-- Left Panel -->
<script src="../Diseño/assets/js/vendor/jquery-2.1.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
<script src="../Diseño/assets/js/plugins.js"></script>
<script src="../Diseño/assets/js/main.js"></script>


<script src="../Diseño/assets/js/lib/chart-js/Chart.bundle.js"></script>
<script src="../Diseño/assets/js/dashboard.js"></script>
<script src="../Diseño/assets/js/widgets.js"></script>
<script src="../Diseño/assets/js/lib/vector-map/jquery.vmap.js"></script>
<script src="../Diseño/assets/js/lib/vector-map/jquery.vmap.min.js"></script>
<script src="../Diseño/assets/js/lib/vector-map/jquery.vmap.sampledata.js"></script>
<script src="../Diseño/assets/js/lib/vector-map/country/jquery.vmap.world.js"></script>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../Diseño/js/bootstrap.min.js"></script>
</html>
