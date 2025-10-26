<%@ Page Title="" Language="C#" MasterPageFile="~/Empleados/Empleados.Master" AutoEventWireup="true" CodeBehind="EmpGuardarAlquiler.aspx.cs" Inherits="IngenieriaVisualPH.Empleados.Formulario_web120" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
     <style>
        body {
            background: #134E5E; /* fallback for old browsers */
            background: -webkit-linear-gradient(to right, #71B280, #134E5E); /* Chrome 10-25, Safari 5.1-6 */
            background: linear-gradient(to right, #71B280, #134E5E); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
        }
    </style>
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
        <form id="form" runat="server">
            <div id="programacion" runat="server">
                <div class="card border border-danger">
                    <div class="container">
                        <div class="alert alert-danger" id="error2" runat="server" style="margin-top: 10px; display: none">
                            <span class="badge badge-pill badge-danger">Error</span>
                            <strong>Debe Ingresar Torre y Apartamento</strong>
                            &nbsp;&nbsp;
                        </div>
                        <div class="card-header">
                            <strong class="card-title">Ingrese Torre y Apartamento que visita</strong>
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
                        <label for="" class="control-label mb-1 font-weight-bold">Placa</label>
                        <asp:TextBox ID="txtplaca" runat="server" CssClass="form-control" MaxLength="6"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                            ErrorMessage="# placa requerida" ForeColor="Red" ControlToValidate="txtplaca" Text="*Requerido">
                        </asp:RequiredFieldValidator>
                        <p></p>
                        <label for="" class="control-label mb-1 font-weight-bold">Marca</label>
                        <asp:TextBox ID="txtmarca" runat="server" CssClass="form-control" MaxLength="20"></asp:TextBox>
                        <p></p>
                        <label for="" class="control-label mb-1 font-weight-bold">Nombre</label>
                        <asp:TextBox ID="txtnombre" runat="server" CssClass="form-control" MaxLength="49"></asp:TextBox>
                        <div class="card-body">
                             <label for="" class="control-label mb-1 font-weight-bold">N° Parqueadero</label>
                            <asp:DropDownList ID="ddnumparq" runat="server" CssClass="form-control" DataSourceID="SqlDataSource2" DataTextField="NumParqueadero" DataValueField="NumParqueadero">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:IngenieriaVisualPHConnectionString %>" SelectCommand="SELECT * FROM [ParTbl_NumParqueadeo]"></asp:SqlDataSource>
                            &nbsp;&nbsp;&nbsp;  
                        </div>
                        <p></p>

                        <asp:Button ID="btnguardar" runat="server" Font-Bold="true" class="btn-block btn-lg btn-success border border-light " Text="Guardar" OnClick="btnguardar_Click" />
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
                        <br />
                        <br />
                    </div>
                </div>
            </div>
        </form>
    </div>
</asp:Content>
