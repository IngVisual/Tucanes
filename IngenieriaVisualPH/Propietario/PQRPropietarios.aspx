    <%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="PQRPropietarios.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web123" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
    <link href="../Diseño/Color.css" rel="stylesheet" />
    <script>      
        function pregunta1SI() {
            document.getElementById("pregunta1").style.display = "none";
            document.getElementById("imagen").style.display = "block";
        }
        function pregunta1NO() {                
            document.getElementById("pregunta1").style.display = "none";
        }
        function pregunta2SI() {
            document.getElementById("pregunta2").style.display = "none";
            document.getElementById("quejas").style.display = "block";
            document.getElementById("button").style.display = "block";
        }
        function pregunta2NO() {
            document.getElementById("pregunta2").style.display = "none";
            document.getElementById("button").style.display = "block";
        }
    </script>
 <link href="../Diseño/Banner.css" rel="stylesheet" />
    <script>
        function DesactivarBoton() {
            document.getElementById("conta").style.display = "none";
            document.getElementById("procesando").style.display = "block";
        }
        window.onbeforeunload = DesactivarBoton;
    </script>

    <div id="procesando" class="ventana3" style="display:none">
        <img src="../Diseño/Imagenes/coheteLoading.gif" />
        <h5 class="text-right text-center font-weight-bold">Por favor espere un momento, Cargando.....</h5>
    </div>
    <div class="container" id="conta">
        <h3 class="text-center textocolorinfo font-weight-bold">Tramite PQR</h3>
        <form id="fo1" runat="server">
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblMessage" runat="server"  Font-Bold="True" CssClass="form-control alert alert-danger"  Visible="False"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="true" ForeColor="Red" />
                </td>
            </tr>
            <asp:Label ID="lblrespuesta" runat="server" Text="Pendiente" Visible="False"></asp:Label>
            <asp:Label ID="lblcodigo1" runat="server" Text="" Visible="False"></asp:Label>
            <asp:Label ID="lblcodigo" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="lblleido" runat="server" Text="no" Visible="false"></asp:Label>
            <asp:Label ID="lblfecha" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="lblarea" runat="server" Text="Area" CssClass="form-control" ForeColor="Red" Visible="False"></asp:Label>
            <br />
            <div>
                <asp:Label ID="Label1" runat="server" Text="¡Hola Residente! La respuesta de esta solicitud depende de la cantidad de solicitudes enviadas por los apartamentos del conjunto." Font-Bold="True" CssClass="form-control bgcolor" ForeColor="White"></asp:Label>
            </div>
            <br />
            <div class="alert alert-success" id="error" runat="server" style="margin-top: 10px; display: none">
                <span class="badge badge-pill badge-success">Listo</span>
                <strong>Su solicitud se envió correctamente, por favor tenga presente que estas solicitudes se responden en horario de atención. ¿Desea ver su solicitud Enviada..? 
                    &nbsp;&nbsp;<a href="ProTabResPag.aspx">
                        <button id="btnsi" type="button" class="btn-block btn-success font-weight-bold form-control border-light animate__animated animate__pulse animate__infinite">Si</button></a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="Home.aspx">
                        <button id="btnno" type="button" class="btn-block btn-secondary font-weight-bold form-control border-light animate__animated animate__pulse animate__infinite">No</button></a>
                </strong>
                <br />
            </div>
            <br />
            <asp:DropDownList ID="ddlista" runat="server" Visible="False">
                <asp:ListItem>Abierta</asp:ListItem>
            </asp:DropDownList>
            <div class="form-group">
                <label class=" form-control-label textocolorinfo font-weight-bold">Nombre</label>
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-user"></i></div>
                    <asp:TextBox ID="txtnombre" runat="server" Text="" CssClass="form-control" Enabled="True"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorusuario" runat="server" Display="Dynamic"
                        ErrorMessage="El nombre es requerido" ControlToValidate="txtnombre" Text="*">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <label class=" form-control-label textocolorinfo font-weight-bold">Tipo de PQR</label>
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-user"></i></div>
                    <asp:DropDownList ID="ddtipo" runat="server" CssClass="form-control" ForeColor="#333333">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Ruido</asp:ListItem>
                        <asp:ListItem>Mantenimiento</asp:ListItem>
                        <asp:ListItem>Vandalismo o robos</asp:ListItem>
                        <asp:ListItem>Fumigacion</asp:ListItem>
                        <asp:ListItem>Bebidas alcoholicas o estupefacientes</asp:ListItem>
                        <asp:ListItem>Mascotas</asp:ListItem>
                        <asp:ListItem>Estetica del conjunto</asp:ListItem>
                        <asp:ListItem>Vigilancia</asp:ListItem>
                        <asp:ListItem>Shoot de basura</asp:ListItem>
                        <asp:ListItem>Privacidad</asp:ListItem>
                        <asp:ListItem>Agresion verbal o fisica</asp:ListItem>
                        <asp:ListItem>Parqueaderos</asp:ListItem>
                        <asp:ListItem>Zonas comunes</asp:ListItem>
                        <asp:ListItem>Porteria</asp:ListItem>
                        <asp:ListItem>Otros (Saldos NO)</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                        ErrorMessage="El tipo de pqr es requerido" ControlToValidate="ddtipo" Text="*">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <label class=" form-control-label textocolorinfo font-weight-bold">Descripcion del PQR</label>
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-edit"></i></div>
                    <asp:TextBox ID="txtobservacion" runat="server" Text="" CssClass="form-control" Enabled="True" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                        ErrorMessage="La observacion es requerida" ControlToValidate="txtobservacion" Text="*">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
            <div id="pregunta1">
                <strong class="card-title textocolorinfo font-weight-bold">¿Desea adjuntar alguna Imagen sobre el PQR?</strong>
                <p>
                    <button id="btn3" onclick="pregunta1SI()" type="button" class="btn-success border border-light font-weight-bold" style="width: 70px; border-radius: 3px">Si</button>
                    <button id="btn4" onclick="pregunta1NO()" type="button" class="btn-secondary border border-light font-weight-bold" style="width: 70px; border-radius: 3px">No</button>
                </p>
            </div>
            <div class="form-group" id="imagen" style="display: none">
                <p class="textocolorinfo font-weight-bold"><i class="fa fa-hand-o-right">&nbsp;&nbsp;CLICK en Elegir archivo</i></p>
                <p class="textocolorinfo font-weight-bold"><i class="fa fa-hand-o-right">&nbsp;&nbsp;Elija una IMAGEN</i></p>
                <p>
                    <h4 class="textocolorinfo font-weight-bold"><i class="fa fa-hand-o-right">&nbsp;&nbsp;NO ADMITE PDF, SOLO ADMITE IMAGENES.</i></h4>
                </p>
                <asp:FileUpload ID="f1" AllowMultiple="true" Font-Bold="true" runat="server" CssClass="form-control" />
            </div>
            <br />
            <div id="pregunta2">
                <strong class="card-title textocolorinfo font-weight-bold">¿Su queja es por el comportamiento de algun vecino?</strong>
                <p>
                    <button id="btn10" type="button" onclick="pregunta2SI()" class="btn-success border border-light font-weight-bold" style="width: 70px; border-radius: 3px">Si</button>
                    <button id="btn22" type="button" onclick="pregunta2NO()" class="btn-secondary border border-light font-weight-bold" style="width: 70px; border-radius: 3px">No</button>
                </p>
            </div>
            <div class="card bordercolorinfo" id="quejas" style="display: none;border-radius:7px">
                <div class="card-header">
                    <strong class="card-title">Ingrese Torre y Apartamento QUE ESTA INFRINGIENDO las normas de convivencia, solo SI es el caso.(OPCIONAL)</strong>
                </div>
                <div class="row">
                    <div class="card-body">
                        <div class="col-xs-6 col-lg-12">
                            <div class="col-xs-3 col-lg-6">
                                <asp:DropDownList ID="ddltor" runat="server" CssClass="form-control textocolorinfo" DataSourceID="SqlDataSource1" DataTextField="Torre" DataValueField="Torre">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IngenieriaVisualPHConnectionString %>" SelectCommand="SELECT * FROM [tblVivienda]"></asp:SqlDataSource>
                                &nbsp;&nbsp;&nbsp;                      
                            </div>
                            <div class="col-xs-3 col-lg-6">
                                <asp:DropDownList ID="ddapa" runat="server" CssClass="form-control textocolorinfo" DataSourceID="SqlDataSource1" DataTextField="Apartamento" DataValueField="Apartamento">
                                </asp:DropDownList>&nbsp;&nbsp;&nbsp;
              
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="button" style="display: none">
                <asp:Button ID="btnenviarpqr" runat="server" Font-Bold="true" class="btn-block btn-lg btncolorinfo border border-light " Text="Enviar PQR" OnClick="btnenviarpqr_Click" />
            </div>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </form>
    </div>
</asp:Content>
