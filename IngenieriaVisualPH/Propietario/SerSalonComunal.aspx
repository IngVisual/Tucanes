<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="SerSalonComunal.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web141" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
<link href="../Diseño/Color.css" rel="stylesheet" />
    <link href="../Diseño/Banner.css" rel="stylesheet" />
<script>
    function DesactivarBoton() {
          document.getElementById("conta").style.display = "none"
        document.getElementById('<%=btnsave.ClientID%>').disabled = true;
        document.getElementById('<%=FileUpload1.ClientID%>').disabled = true;
        document.getElementById("procesando").style.display = "block"
    }
    window.onbeforeunload = DesactivarBoton;
</script>
        <script>
        function ContratoSI() {
            document.getElementById("display1").style.display = "none";
            document.getElementById("display2").style.display = "block";
            }
                    function f1SI() {
            document.getElementById("display2").style.display = "none";
            document.getElementById("display3").style.display = "block";
            }
              function f2NO() {
            document.getElementById("display2").style.display = "block";
            document.getElementById("display3").style.display = "none";
            }
        </script>
    <div id="procesando" class="ventana3" style="display: none">
        <img src="../Diseño/Imagenes/coheteLoading.gif" />
        <h5 class="text-right text-center font-weight-bold">Por favor espere un momento, Cargando Solicitud.....</h5>
    </div>
    <div class="container" id="conta">
        <form id="fo1" runat="server">
            <div class="card-body">
                <div class="card-title">
                    <h3 class="text-center textocolorinfo font-weight-bold ">Enviar Solicitud Salon Comunal</h3>
                </div>
                <div>
                    <asp:Label ID="lblmensaje" runat="server" CssClass="form-control alert alert-danger" Font-Bold="true" Visible="False"></asp:Label>
                </div>
                <td colspan="2">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="true" CssClass="text-danger" />
                </td>
                <div id="display1">
                    <div class="card bordercolorinfo">
                        <div class="card-header">
                            <strong>Politica de Alquiler Salon Comunal</strong>
                        </div>
                        <div class="card-body">
                            <p>
                                <button id="btn2" onclick="ContratoSI()" type="button" class=" btncolorinfo btn-lg border border-light font-weight-bold" style="border-radius: 3px">Acepto</button>
                            </p>
                            <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
                <div id="display2" style="display: none">
                    <div class="form-group">
                        <asp:Label ID="lblperdida" runat="server" Text="¿Para quien es el Alquiler? " CssClass="textocolorinfo font-weight-bold"></asp:Label>
                        <asp:DropDownList ID="ddcanti" runat="server" CssClass="form-control" ForeColor="Red">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>Propietario</asp:ListItem>
                            <asp:ListItem>Inquilino</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorusuario" runat="server" Display="Dynamic"
                            ErrorMessage="Debe llenar la casilla ¿para quien es el parqueadero?" ControlToValidate="ddcanti" Text="*">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label class=" form-control-label textocolorinfo font-weight-bold">Nombre</label>
                        <div class="input-group">
                            <div class="input-group-addon"><i class="fa fa-user"></i></div>
                            <asp:TextBox ID="txtnombre" runat="server" Text="" CssClass="form-control" Enabled="True"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                                ErrorMessage="El nombre es requerido" ControlToValidate="txtnombre" Text="*">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class=" form-control-label textocolorinfo font-weight-bold">Cedula</label>
                        <div class="input-group">
                            <div class="input-group-addon"><i class="fa fa-credit-card"></i></div>
                            <asp:TextBox ID="txtcedula" runat="server" Text="" CssClass="form-control" MaxLength="11" TextMode="Number"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                                ErrorMessage="La cedula es requerida" ControlToValidate="txtcedula" Text="*">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class=" form-control-label textocolorinfo font-weight-bold">Descripción del Evento</label>
                        <div class="input-group">
                            <div class="input-group-addon"><i class="fa fa-edit"></i></div>
                            <asp:TextBox ID="txtobservacion" runat="server" Text="Opcional" MaxLength="100" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>
                    <br />
                    <div class="form-group" id="foto1">
                        <asp:Label ID="Label5" runat="server" CssClass=" form-control-label textocolorinfo font-weight-bold" Text="Seleccionar Imagen o foto del recibo" Font-Bold="True"></asp:Label>
                        <asp:FileUpload ID="FileUpload1" Font-Bold="true" runat="server" CssClass="form-control bordercolorinfo" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic"
                            ErrorMessage="Debe subir una Imagen o foto del recibo" ControlToValidate="FileUpload1" Text="*">
                        </asp:RequiredFieldValidator>
                        <label class="text-dark font-weight-bold">Click en Seleccionar Archivo para buscar tu IMAGEN y despues Click en Siguiente</label>
                        <p></p>
                        <p>
                            <button id="f1" onclick="f1SI()" type="button" class="btncolorinfo btn-lg border border-light font-weight-bold" style="border-radius: 3px">Siguiente >></button>
                        </p>
                    </div>
                </div>
                <div id="display3" style="display: none">
                    <p></p>
                    <p>
                        <button id="f2no" onclick="f2NO()" type="button" class="btn-secondary btn-lg border border-light font-weight-bold" style="border-radius: 3px">Atras</button>
                    </p>
                    <br />
                    <br />
                    <asp:Button ID="btnsave" runat="server" Text="Enviar Solicitud" CssClass="btn-block btn-lg form-control btncolorinfo font-weight-bold btn-block border border-light" OnClick="btnsave_Click" />
                </div>
            </div>
        </form>
    </div>
</asp:Content>
