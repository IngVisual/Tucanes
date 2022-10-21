<%@ Page Title="" Language="C#" MasterPageFile="~/Empleados/Aseo.Master" AutoEventWireup="true" CodeBehind="HomeA.aspx.cs" Inherits="IngenieriaVisualPH.Empleados.Formulario_web112" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
    <form id="form1" runat="server">
       
        <div class="col-xs-2">
            <section class="card card border border-success" style="border-radius: 10px">
                <div class="card-body text-secondary">
                    <a href="EmpQuejaAseo.aspx">
                        <button type="button" class="bg-success text-light" style="margin-bottom: 4px; width: 75px; border-radius: 7px">
                            <img class="mx-auto d-block" src="../Diseño/Imagenes/aseo.png" alt="Card image cap" width="45" height="45">
                            <asp:Label ID="Label3" Font-Bold="true" Font-Size="Small" runat="server" Text="PQR"></asp:Label>
                        </button>
                    </a>
                </div>
            </section>
        </div>                    
         <div class="col-xs-2">
            <section class="card card border border-success" style="border-radius: 10px">
                <div class="card-body text-secondary">
                    <a href="VigSCAseo.aspx">
                        <button type="button" class="bg-success text-light" style="margin-bottom: 4px; width: 75px; border-radius: 7px">
                            <img class="mx-auto d-block" src="../Diseño/Imagenes/evento (1).png" alt="Card image cap" width="45" height="45">
                            <asp:Label ID="Label7" Font-Bold="true" Font-Size="Small" runat="server" Text="SalonCo"></asp:Label>
                        </button>
                    </a>
                </div>
            </section>
        </div>
<%--        <div class="col-xs-2">
            <section class="card card border border-success" style="border-radius: 10px">
                <div class="card-body text-secondary">
                    <a href="RegSCAseo.aspx">
                        <button type="button" class="bg-success text-light" style="margin-bottom: 4px; width: 75px; border-radius: 7px">
                            <img class="mx-auto d-block" src="../Diseño/Imagenes/mante.png" alt="Card image cap" width="45" height="45">
                            <asp:Label ID="Label1" Font-Bold="true" Font-Size="Small" runat="server" Text="Registro"></asp:Label>
                        </button>
                    </a>
                </div>
            </section>
        </div>--%>  

    </form>
    <br />
</asp:Content>
