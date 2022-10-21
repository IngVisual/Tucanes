<%@ Page Title="" Language="C#" MasterPageFile="~/Empleados/Empleados.Master" AutoEventWireup="true" CodeBehind="EmpRegistroVisitantes.aspx.cs" Inherits="IngenieriaVisualPH.Empleados.Formulario_web12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
     <link href="../Diseño/Banner.css" rel="stylesheet" />
    <script>
    function DesactivarBoton() {
        document.getElementById("conta").style.display = "none";
        document.getElementById("procesando").style.display = "block";
    }
    window.onbeforeunload = DesactivarBoton;
</script>
    <div id="procesando" class="ventana">
        <img src="../Diseño/Imagenes/coheteLoading.gif" />
        <h5 class="text-right text-center font-weight-bold">Por favor espere un momento, Cargando.....</h5>
    </div>
     <div class="container" id="conta">
    <form id="fo1" runat="server" >        
        <div class="alert alert-success" id="error1" runat="server" style="margin-top: 10px; display: none">
            <span class="badge badge-pill badge-success">Listo</span>
           Registro Guardado Correctamente.
                                              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                  <span aria-hidden="true">&times;</span>
                                              </button>
        </div>
                <div class="alert alert-danger" id="Div1" runat="server" style="margin-top: 10px; display: none">
            <span class="badge badge-pill badge-danger">Error</span>
           Ingrese torre y apartamento.
                                              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                  <span aria-hidden="true">&times;</span>
                                              </button>
        </div>
        <tr>
            <td colspan="2">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" Font-Bold="true" />
            </td>
        </tr>
        <br />
        <div class="card border border-danger">
            <div class="card-header">
                <strong class="card-title">Ingrese Torre y Apartamento </strong>
            </div>
                <div class="row">
                    &nbsp;&nbsp; 
                        <div class="card-body">
                            <asp:DropDownList ID="ddltor" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="Torre" DataValueField="Torre">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IngenieriaVisualPHConnectionString %>" SelectCommand="SELECT * FROM [tblVivienda]"></asp:SqlDataSource>
                            &nbsp;&nbsp;&nbsp;  
                        </div>
                    <div class="card-body">
                        <asp:DropDownList ID="ddapa" runat="server" CssClass="form-control" ForeColor="#333333" DataSourceID="SqlDataSource1" DataTextField="Apartamento" DataValueField="Apartamento">
                        </asp:DropDownList>&nbsp;&nbsp;&nbsp;
                    </div>
                    &nbsp;&nbsp;&nbsp;
                </div>
        </div>
        <div class="form-group">
            <label for="" class="form-control-label text-dark font-weight-bold">Nombre de las personas que visitan</label>
            <div class="input-group">
                <div class="input-group-addon"><i class="fa fa-users"></i></div>
                <asp:TextBox ID="txtuuario" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorusuario" runat="server" Display="Dynamic"
                    ErrorMessage="El nombre es requerido" ForeColor="Red" ControlToValidate="txtuuario" Text="*">
                </asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <label for="" class="form-control-label text-dark font-weight-bold">Tipo de Visita</label>
            <div class="input-group">
                <div class="input-group-addon"><i class="fa fa-book"></i></div>
                <asp:DropDownList ID="ddobs" Font-Bold="true" CssClass="form-control" runat="server" ForeColor="Red">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>VISITA FAMILIAR</asp:ListItem>
                    <asp:ListItem>VISITA SERVICIO TECNICO</asp:ListItem>
                    <asp:ListItem>VISITA SERVICIO GENERAL</asp:ListItem>
                    <asp:ListItem>VISITA LABORAL</asp:ListItem>
                    <asp:ListItem>VISITA COBRANZA</asp:ListItem>
                    <asp:ListItem>VISITA ENTREGA DE PAQUETE</asp:ListItem>
                    <asp:ListItem>VISITA EVENTO SALON COMUNAL</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                    ErrorMessage="la observacion es requerida" ForeColor="Red" ControlToValidate="ddobs" Text="*">
                </asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <label for="" class="form-control-label text-dark font-weight-bold">PLaca Vehiculo </label>
            <div class="input-group">
                <div class="input-group-addon"><i class="fa fa-barcode"></i></div>
                <asp:TextBox ID="txtplaca" runat="server" CssClass="form-control" Text="" TextMode="SingleLine"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <label for="" class="form-control-label text-dark font-weight-bold">Tipo de Vehiculo</label>
            <div class="input-group">
                <div class="input-group-addon"><i class="fa fa-plus-square"></i></div>
                <asp:DropDownList ID="ddvehiculo" Font-Bold="true" CssClass="form-control" runat="server" ForeColor="Red">
                    <asp:ListItem>N/A</asp:ListItem>
                    <asp:ListItem>MOTO</asp:ListItem>
                    <asp:ListItem>CARRO</asp:ListItem>
                    <asp:ListItem>CICLA</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <br />
        <div>
            <asp:Button ID="btnguardar" Font-Bold="true" runat="server" class="btn-block btn-lg btn-success border-light " Text="Enviar Visita" OnClick="btnguardar_Click" />
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    </form>
     </div>
</asp:Content>
