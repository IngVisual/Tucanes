<%@ Page Title="" Language="C#" MasterPageFile="~/Empleados/Empleados.Master" AutoEventWireup="true" CodeBehind="Citofonia.aspx.cs" Inherits="IngenieriaVisualPH.Empleados.Formulario_web11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
     <div class="container">
                <h3 class="text-center">Citofono</h3>
        <form  id="fo2" runat="server">
            <br />
            <div id="teclado" runat="server">
            <div class="form-group">
                <br />
                <asp:TextBox ID="txtbuscar" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtbuscar_TextChanged" placeholder="Ingrese Codigo" aria-label="" TextMode="Number"></asp:TextBox>
                <br />
            </div>
           </div>
            <br />
            <div id="telefonos" runat="server" style="display:none">
            <p>Prohibido el ingreso a: &nbsp; <asp:Label ID="lblpro" ForeColor="Red" Font-Bold="true" runat="server"></asp:Label></p>
            <p>Actualmente habitan la vivienda:&nbsp;<asp:Label ID="lblmay" runat="server"></asp:Label>&nbsp;<asp:Label ID="lblmen" runat="server"></asp:Label></p>
            <p>
             <asp:Button ID="Button1" Font-Bold="true" runat="server" style="border-radius:5px" class="btn btn-lg btn-danger" Text="<< Volver" OnClick="Button1_Click"/>
            </p>
                <asp:TextBox ID="txtfechaini" runat="server" Visible="false" CssClass="form-control" AutoPostBack="true" TextMode="Date"></asp:TextBox>
             <asp:TextBox ID="txtfechafinal" runat="server" Visible="false" CssClass="form-control" AutoPostBack="true"  TextMode="Date"></asp:TextBox>
            <div class="table col-6">
                <asp:GridView ID="GridView1" Font-Size="Small" runat="server" EmptyDataText="Hoy no tiene visitas programadas" AllowPaging="True" CssClass="table table-bordered table-hover" AutoGenerateColumns="False" PageSize="15" Height="2px">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
                        <asp:BoundField DataField="Codigo" HeaderText="Codigo" SortExpression="Codigo" Visible="False" />
                        <asp:BoundField DataField="FechaPro" HeaderText="Fecha" SortExpression="Fecha" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="Usuario" HeaderText="Usuario" SortExpression="Usuario" />
                        <asp:BoundField DataField="Observacion" HeaderText="Observacion" SortExpression="Observacion" />
                        <asp:BoundField DataField="Vehiculo" HeaderText="Vehiculo" SortExpression="Vehiculo" />
                        <asp:BoundField DataField="PlacaVehiculo" HeaderText="Placa" SortExpression="Placa" />
                        <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" Visible="False" />
                    </Columns>
                </asp:GridView>
            </div>
                <div class="form-group">
                <asp:Label ID="lblMessage" runat="server" Text="Celular Propietario:" Font-Bold="True" ForeColor="Red"></asp:Label>&nbsp;&nbsp;&nbsp;
                <i class="menu-icon fa fa-phone"></i>
                <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#FF5050" CssClass="form-control" ImageHeight="60px" ImageUrl="../Diseño/Imagenes/cit.png">Marcar</asp:HyperLink>
                <asp:TextBox ID="txttel1" runat="server" Text="" Visible="False"></asp:TextBox>
                <asp:Label ID="Label1" runat="server" Text="tel:" Visible="False"></asp:Label>
                <asp:Label ID="lblok" Font-Bold="true" ForeColor="Red" runat="server" Text="Si tiene numero, ya puede marcar" Visible="False"></asp:Label>
            </div>
            <br />
            <div class="form-group">
                <asp:Label ID="lblMessage2" runat="server" Text="Celular Propietario:" Font-Bold="True" ForeColor="Red"></asp:Label>&nbsp;&nbsp;&nbsp;
                                             <i class="menu-icon fa fa-phone"></i>
                <asp:HyperLink ID="HyperLink2" runat="server" ForeColor="#FF5050" CssClass="form-control" ImageHeight="60px" ImageUrl="../Diseño/Imagenes/cit.png">Marcar</asp:HyperLink>
                <asp:TextBox ID="txttel2" runat="server" Text="" Visible="False"></asp:TextBox>
                <asp:Label ID="Label2" runat="server" Text="tel:" Visible="False"></asp:Label>
                <asp:Label ID="lblok1" Font-Bold="true" ForeColor="Red" runat="server" Text="Si tiene numero, ya puede marcar" Visible="False"></asp:Label>
            </div>
            <br />
            <div class="form-group">
                <asp:Label ID="lblMessage3" runat="server" Text="Celular Inquilino:" Font-Bold="True" ForeColor="Green"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                             <i class="menu-icon fa fa-phone"></i>
                <asp:HyperLink ID="HyperLink3" runat="server" ForeColor="#009933" CssClass="form-control" ImageHeight="60px" ImageUrl="../Diseño/Imagenes/cit.png">Marcar</asp:HyperLink>
                <asp:TextBox ID="txttel3" runat="server" Text="" Visible="False"></asp:TextBox>
                <asp:Label ID="Label3" runat="server" Text="tel:" Visible="False"></asp:Label>
                <asp:Label ID="lblok2" Font-Bold="True" ForeColor="Green" runat="server" Text="Si tiene numero, ya puede marcar" Visible="False"></asp:Label>
            </div>
            <br />
          </div>
            <br />
            <br />
            <br />
            <br />
        </form>


    </div>  
</asp:Content>
