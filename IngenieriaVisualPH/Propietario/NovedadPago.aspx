<%@ Page Title="" Language="C#"  MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="NovedadPago.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web116" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
<link href="../Diseño/Color.css" rel="stylesheet" />
    <link href="../Diseño/Banner.css" rel="stylesheet" />
<script>
    function DesactivarBoton() {
        document.getElementById("conta").style.display = "none"
        document.getElementById("procesando").style.display = "block"
        document.getElementById('<%=btnsave.ClientID%>').disabled = true;
        document.getElementById('<%=fileupload1.ClientID%>').disabled = true;
    }
    window.onbeforeunload = DesactivarBoton;
</script>
    <div id="procesando" class="ventana3" style="display:none">
        <img src="../Diseño/Imagenes/coheteLoading.gif" />
        <h5 class="text-right text-center font-weight-bold">Por favor espere un momento, Cargando Imagenes.....</h5>
    </div>
  <div class="container" id="conta">
    <form id="fo1" runat="server">
            <div class="card-body">
                <div class="card-title">
                    <h3 class="text-center textocolorinfo font-weight-bold ">Novedades de Pago</h3>
                </div>
            </div>
            <br />
            <div class="alert alert-success" id="error" runat="server" style="margin-top: 10px; display: none">
                <span class="badge badge-pill badge-success">Listo</span>
                <strong>Su solicitud se envió correctamente y la tendremos en cuenta para el corte contable. ¿Desea ver su solicitud Enviada..? 
                    &nbsp;&nbsp;<a href="ProTabResPag.aspx">
                        <button id="btnsi" type="button"  class="btn-block btn-success font-weight-bold form-control border-light animate__animated animate__pulse animate__infinite">Si</button></a>
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="Home.aspx">
                     <button id="btnno" type="button"  class="btn-block btn-secondary font-weight-bold form-control border-light animate__animated animate__pulse animate__infinite">No</button></a>
                </strong>
                <br />
            </div>
            <div>
                <asp:Label ID="lblmensaje" runat="server" CssClass="form-control alert alert-danger" Font-Bold="true" Visible="False"></asp:Label>
            </div>
            <div>
                <asp:Label ID="lblcodigo" runat="server" Text="" Visible="False"></asp:Label>
                <asp:Label ID="lblestado" runat="server" Text="Abierta" Visible="False"></asp:Label>
                <asp:Label ID="lblresp" runat="server" Text="Pendiente" Visible="False"></asp:Label>
                <asp:Label ID="lblfecha" runat="server" Text="Pendiente" Visible="False"></asp:Label>
            </div>
            <div class="form-group">
                <label class=" form-control-label textocolorinfo font-weight-bold">Describa su novedad de saldo</label>
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-edit"></i></div>
                    <asp:TextBox ID="txtobservacion" runat="server" Text="" CssClass="form-control" Enabled="True" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>
            <br />
            <p class="textocolorinfo font-weight-bold"><i class="fa fa-hand-o-right">&nbsp;&nbsp;CLICK en Elegir archivo</i></p>
            <p class="textocolorinfo font-weight-bold"><i class="fa fa-hand-o-right">&nbsp;&nbsp;Elija UNA o VARIAS imagenes de sus recibos en la misma solicitud</i></p>
            <p class="textocolorinfo font-weight-bold"><i class="fa fa-hand-o-right">&nbsp;&nbsp;CLICK en Enviar.</i></p>
            <p ><h4 class="textocolorinfo font-weight-bold"><i class="fa fa-hand-o-right">&nbsp;&nbsp;NO ADMITE PDF, SOLO ADMITE IMAGENES.</i></h4></p>
            <div class="form-group">
                <asp:FileUpload ID="fileupload1" AllowMultiple="true" Font-Bold="true" CssClass="form-control" runat="server" />
                <div class="col-sm3">
                    <i class="fa fa-upload text-light font-weight-bold"></i>
                    <asp:Button ID="btnsave" runat="server" Text="Enviar Solicitud" CssClass="btn-block btn-lg form-control btncolorinfo font-weight-bold btn-block border border-light" OnClick="btnsave_Click" />
                </div>
            </div>
            <br />
        <script src="../Diseño/bootstrap-5.0.1-dist/bootstrap-5.0.1-dist/js/bootstrap.min.js"></script>
        <script src="../Diseño/bootstrap-5.0.1-dist/bootstrap-5.0.1-dist/js/jquery.min.js"></script>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    </form>
    </div>
</asp:Content>
