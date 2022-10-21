<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="ProVerResSC.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web144" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
    <link href="../Diseño/Color.css" rel="stylesheet" />
    <div>
        <h3 class="text-center textocolorinfo font-weight-bold ">Respuesta&nbsp;&nbsp;<span class="badge badge-primary mt-1"><asp:Label ID="lblestado" runat="server" Text=""></asp:Label></span></h3>
        <br />
        <form id="form1" runat="server">
            <section >
                <div class="col-md-6">
                      <div class="card bordercolorinfo" style="border-radius:7px">
                        <div class="card-header">
                            <strong class="card-title">Fecha Solicitud--<asp:Label ID="lblfecini" CssClass="font-weight-bold textocolorinfo" runat="server" Text=""></asp:Label></strong>
                            <p></p>
                            <p>Alquilado por:&nbsp;&nbsp;<asp:Label ID="lblnombre" Font-Size="Small" CssClass="font-weight-bold textocolorinfo" runat="server" Text=""></asp:Label></p>
                            <p>Salon Comunal:&nbsp;&nbsp;<asp:Label ID="lbltiposc" Font-Size="Small" CssClass="font-weight-bold textocolorinfo" runat="server" Text=""></asp:Label></p>
                            <p>Tipo de Residente:&nbsp;&nbsp;&nbsp;<asp:Label ID="lbltipo" Font-Size="Small" CssClass="font-weight-bold textocolorinfo" runat="server" Text=""></asp:Label></p>
                            <p>Cedula:&nbsp;&nbsp;&nbsp;<asp:Label ID="lblcedula" Font-Size="Small" CssClass="font-weight-bold textocolorinfo" runat="server" Text=""></asp:Label></p>
                            <p>Fecha de Solicitud:&nbsp;&nbsp;&nbsp;<asp:Label ID="lblfechasol" Font-Size="Small" CssClass="font-weight-bold textocolorinfo" runat="server" Text=""></asp:Label></p>
                            <p>Fecha MAX de Pago:&nbsp;&nbsp;&nbsp;<asp:Label ID="lblfechapag" Font-Size="Small" CssClass="font-weight-bold textocolorinfo " runat="server" Text=""></asp:Label></p>
                            <p>Fecha del Evento:&nbsp;&nbsp;&nbsp;<asp:Label ID="lblfeceven" Font-Size="Small" CssClass="font-weight-bold textocolorinfo" runat="server" Text=""></asp:Label></p>
                            <p>Observacion:&nbsp;&nbsp;&nbsp;<asp:Label ID="lblobserv" Font-Size="Small" CssClass="font-weight-bold textocolorinfo" runat="server" Text=""></asp:Label></p>
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
                            <strong class="card-title">Novedad del Vigilante sobre el Evento</strong>
                        </div>
                        <div class="card-body">
                            <p class="card-text">
                                <asp:Label ID="lblnove" CssClass="textocolorinfo" runat="server" Text=""></asp:Label>
                            </p>
                        </div>
                    </div>
                   <div>
                </div>
            </div>
          </section>
            <section id="imagen" runat="server">
                <asp:Repeater ID="r1" runat="server">
                    <ItemTemplate>
                        <div class="col-md-4">
                             <div class="card bordercolorinfo" style="border-radius:7px">
                                <img class="card-img-top" src="../SC/Recibo/<%#Eval("ReciboSC") %>" alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title mb-3">RECIBO</h4>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </section>
              <section id="politica" runat="server">
                 <div class="card bordercolorinfo" style="border-radius:7px">
                    <div class="card-header">
                        <strong class="card-title">Yo &nbsp;&nbsp;<asp:Label ID="lblnombre2" runat="server" Text=""></asp:Label>&nbsp;&nbsp; ACEPTO la siguiente politica de Alquiler Salon Comunal:</strong>
                    </div>
                    <div class="card-body">
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
