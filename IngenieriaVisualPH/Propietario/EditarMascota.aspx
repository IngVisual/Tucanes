<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="EditarMascota.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web168" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
     <link href="../Diseño/Banner.css" rel="stylesheet" />
            <script>
        function DesactivarBoton() {
            document.getElementById("conta").style.display = "none"
            document.getElementById("procesando").style.display = "block"
            document.getElementById('<%=btnactualizar.ClientID%>').disabled = true;
            document.getElementById('<%=FileUpload1.ClientID%>').disabled = true;
        }
        window.onbeforeunload = DesactivarBoton;
            </script>
    <div id="procesando" class="ventana3">
        <img src="../Diseño/Imagenes/coheteLoading.gif" />
        <h5 class="text-right text-center font-weight-bold">Por favor espere un momento, Cargando Solicitud.....</h5>
    </div>
    <div class="container" id="conta">
        <form id="form" runat="server">
            <td colspan="2">
                <asp:Label ID="lblMessage" runat="server" Font-Bold="True" CssClass="form-control alert alert-danger" Visible="False"></asp:Label>
            </td>
            <div class="card-body">
                <div class="form-group">
                    <asp:Label ID="Label5" runat="server" CssClass="textocolorinfo" Font-Size="X-Large" Text="CARNET DE VACUNAS(Cara de frente)" Font-Bold="True"></asp:Label>
                    <p></p>
                    <asp:FileUpload ID="FileUpload1" Font-Bold="true" runat="server" CssClass="form-control bordercolorinfo" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                        ErrorMessage="CARNET DE VACUNAS requerido" ControlToValidate="FileUpload1" ForeColor="Red" Text="* Carnet Requerido">
                    </asp:RequiredFieldValidator>
                    <p></p>
                    <label class="text-danger font-weight-bold">SOLO IMAGENES, NO ADMITE PDF</label>
                </div>
            </div>

            <asp:Button ID="btnactualizar" runat="server" class="btn btn-success font-weight-bold border border-light" Text="Guardar Carnet" OnClick="btnactualizar_Click" />
        </form>
    </div>
</asp:Content>
