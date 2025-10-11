<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="ProVerResBici.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web167" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
    <link href="../Diseño/Color.css" rel="stylesheet" />
    <div >
        <h3 class="text-center textocolorinfo font-weight-bold ">Respuesta&nbsp;&nbsp;<span class="badge badge-primary mt-1"><asp:Label ID="lblestado" runat="server" Text=""></asp:Label></span></h3>
        <br />
        <form id="form1" runat="server">
            <section >
                <div class="col-md-6">
                      <div class="card bordercolorinfo" style="border-radius:7px">
                        <div class="card-header">
                            <strong class="card-title">Fecha Solicitud--<asp:Label ID="lblfecini" CssClass="font-weight-bold textocolorinfo" runat="server" Text=""></asp:Label></strong>
                            <p></p>
                            <p>Nombre:&nbsp;&nbsp;<asp:Label ID="lblnombre" Font-Size="Small"  CssClass="font-weight-bold textocolorinfo" runat="server" Text=""></asp:Label></p>
                            <p>Marca:&nbsp;&nbsp;&nbsp;<asp:Label ID="lblmarca" Font-Size="Small" CssClass="font-weight-bold textocolorinfo" runat="server" Text=""></asp:Label></p>
                            <p>Color:&nbsp;&nbsp;&nbsp;<asp:Label ID="lblcolor" Font-Size="Small" CssClass="font-weight-bold textocolorinfo" runat="server" Text=""></asp:Label></p>
                            <p>Serie:&nbsp;&nbsp;&nbsp;<asp:Label ID="lblserie" Font-Size="Small" CssClass="font-weight-bold textocolorinfo" runat="server" Text=""></asp:Label></p>
                            <p>Tipo Cicla:&nbsp;&nbsp;&nbsp;<asp:Label ID="lbltipocicla" Font-Size="Small" CssClass="font-weight-bold textocolorinfo" runat="server" Text=""></asp:Label></p>
                            <p>Tipo Solicitante:&nbsp;&nbsp;&nbsp;<asp:Label ID="lbltiposolicitante" Font-Size="Small" CssClass="font-weight-bold textocolorinfo" runat="server" Text=""></asp:Label></p>
                            <p>Tipo Persona:&nbsp;&nbsp;&nbsp;<asp:Label ID="lbltipopersona" Font-Size="Small" CssClass="font-weight-bold textocolorinfo" runat="server" Text=""></asp:Label></p>
                            <p></p>
                            </div>
                    </div>
                    <br />
                  <div class="card bordercolorinfo" style="border-radius:7px">
                        <div class="card-header">
                            <strong class="card-title">Respuesta--<asp:Label ID="lblfechres" runat="server" Text=""></asp:Label></strong>
                        </div>
                        <div class="card-body">
                            <p class="card-text">
                                <asp:Label ID="lblresp" CssClass="textocolorinfo" runat="server" Text=""></asp:Label>
                            </p>
                        </div>
                    </div>
                    <br />
                   <div class="card bordercolorinfo" style="border-radius:7px">
                        <div class="card-header">
                            <strong class="card-title">Numero Parqueadero</strong><asp:Label ID="lblobseradmin" CssClass="textocolorinfo" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                   <div>
                </div>
            </div>
          </section>
            <section id="cedula" runat="server">
                <asp:Repeater ID="r1" runat="server">
                    <ItemTemplate>
                        <div class="col-md-4">
                      <div class="card bordercolorinfo" style="border-radius:7px">
                                <img class="card-img-top" src="../SC/Bicicleta/cc/<%#Eval("cc") %>" alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title mb-3">DOCUMENTO DE IDENTIDAD</h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card bordercolorinfo" style="border-radius:7px">
                                <img class="card-img-top" src="../SC/Bicicleta/tp/<%#Eval("tp") %>" alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title mb-3">TARJETA DE PROPIEDAD O FACTURA</h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card bordercolorinfo" style="border-radius:7px">
                                <img class="card-img-top" src="../SC/Bicicleta/bicifoto/<%#Eval("bicifoto") %>" alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title mb-3">FOTO BICICLETA</h4>
                                </div>
                            </div>
                        </div>
                       <div class="col-md-4">
                           <asp:Label ID="Label4" runat="server" CssClass="textocolorinfo" Font-Size="Small" Text="Con esta firma como PROPIETARIO me hago responsable de cumplir las politicas antes mencionadas y así mismo hacerlas cumplir de mi arrendatario en caso de que la solicitud sea para él." Font-Bold="True"></asp:Label>
                             <div class="card bordercolorinfo" style="border-radius:7px">
                               <img class="card-img-top" src="<%#Eval("firmaBici") %>" alt="Card image cap">
                            </div>
                       </div>
                           </ItemTemplate>
                </asp:Repeater>
                <div class="card bordercolorinfo">
                    <div class="card-header">
                        <strong>Politica de Bicicleteros</strong>
                    </div>
                    <div class="card-body">
                        <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </section>
        </form>
        <br />
    </div>
</asp:Content>
