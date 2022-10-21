<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="ProVerResPar.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web128" %>
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
                            <p>Placa Moto:&nbsp;&nbsp;<asp:Label ID="lblplacamoto" Font-Size="Small"  CssClass="font-weight-bold textocolorinfo" runat="server" Text=""></asp:Label></p>
                            <p>Placa Carro:&nbsp;&nbsp;&nbsp;<asp:Label ID="lblplacacarro" Font-Size="Small" CssClass="font-weight-bold textocolorinfo" runat="server" Text=""></asp:Label></p>
                            <p>Placas Carro-Moto:&nbsp;&nbsp;&nbsp;<asp:Label ID="lblcarmot" Font-Size="Small" CssClass="font-weight-bold textocolorinfo" runat="server" Text=""></asp:Label></p>
                            <p>Color/Marca/Modelo:&nbsp;&nbsp;&nbsp;<asp:Label ID="lblcolor" Font-Size="Small" CssClass="font-weight-bold textocolorinfo" runat="server" Text=""></asp:Label></p>
                            <p># Tarjeta de Propiedad:&nbsp;&nbsp;&nbsp;<asp:Label ID="lbltp" Font-Size="Small" CssClass="font-weight-bold textocolorinfo" runat="server" Text=""></asp:Label></p>
                            <p>Destinado a:&nbsp;&nbsp;&nbsp;<asp:Label ID="lbldetino" Font-Size="Small" CssClass="font-weight-bold textocolorinfo" runat="server" Text=""></asp:Label></p>
                            <p></p>
                            <div class="col-4">
                                <asp:Button ID="btnEliminar" runat="server" Visible="false"  OnClientClick="return confirm('¿Esta seguro(a) de eliminar la solicitud?');" class="btn-block btn-lg btn-danger font-weight-bold border" Text="Eliminar" OnClick="btnEliminar_Click" />
                            </div>
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
                   <div>
                </div>
            </div>
          </section>
            <section id="cedula" runat="server">
                <asp:Repeater ID="r1" runat="server">
                    <ItemTemplate>
                        <div class="col-md-4">
                      <div class="card bordercolorinfo" style="border-radius:7px">
                                <img class="card-img-top" src="../Parqueadero/Cedula/<%#Eval("Cedula") %>" alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title mb-3">CEDULA</h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card bordercolorinfo" style="border-radius:7px">
                                <img class="card-img-top" src="../Parqueadero/Soat/<%#Eval("Soat") %>" alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title mb-3">SOAT</h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card bordercolorinfo" style="border-radius:7px">
                                <img class="card-img-top" src="../Parqueadero/TarjetaP/<%#Eval("TarjetaP") %>" alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title mb-3">TARJETA DE PROPIEDAD</h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                             <div class="card bordercolorinfo" style="border-radius:7px">
                                <img class="card-img-top" src="../Parqueadero/Tecnomecanica/<%#Eval("TecnoM") %>" alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title mb-3">TECNO-MECANICA</h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                              <div class="card bordercolorinfo" style="border-radius:7px">
                                <img class="card-img-top" src="../Parqueadero/Vehiculo/<%#Eval("Vehiculo") %>" alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title mb-3">IMAGEN DEL VEHICULO</h4>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </section>
            <section id="politica" runat="server">
                <div class="card border border-danger">
                    <div class="card-header">
                        <strong class="card-title">Yo &nbsp;&nbsp;<asp:Label ID="lblnombre2" runat="server" Text=""></asp:Label>&nbsp;&nbsp; ACEPTO la siguiente politica de Parqueaderos:</strong>
                    </div>
                      <div class="card bordercolorinfo" style="border-radius:7px">
                        <p class="card-text">
                            <asp:Label ID="lblmsm" runat="server" Text=""></asp:Label>
                        </p>
                    </div>
                </div>
            </section>
        </form>
        <br />
    </div>
</asp:Content>
