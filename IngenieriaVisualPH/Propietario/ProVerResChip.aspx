<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="ProVerResChip.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web147" %>
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
                            <p>Chip agregado al residente:&nbsp;&nbsp;<asp:Label Font-Size="Small" ID="lblnombre" CssClass="font-weight-bold textocolorinfo" runat="server" Text=""></asp:Label></p>
                            <p>Documento agregado al chip:&nbsp;&nbsp;&nbsp;<asp:Label ID="lbldocumento" Font-Size="Small" CssClass="font-weight-bold textocolorinfo" runat="server" Text=""></asp:Label></p>
                            <p>Tipo de residente:&nbsp;&nbsp;&nbsp;<asp:Label ID="lblresid" Font-Size="Small" CssClass="font-weight-bold textocolorinfo" runat="server" Text=""></asp:Label></p>
                            <p>Tipo de Chip:&nbsp;&nbsp;&nbsp;<asp:Label ID="lbltipo" Font-Size="Small" CssClass="font-weight-bold textocolorinfo" runat="server" Text=""></asp:Label></p>
                            <p>Motivo de compra:&nbsp;&nbsp;&nbsp;<asp:Label ID="lblcompra" Font-Size="Small" CssClass="font-weight-bold textocolorinfo" runat="server" Text=""></asp:Label></p>                         
                            
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
            <section>
                <asp:Repeater ID="r1" runat="server">
                    <ItemTemplate>
                        <div class="col-md-4">
                             <div class="card bordercolorinfo" style="border-radius:7px">
                                <img class="card-img-top" src="../Chip/Documento/<%#Eval("DocIdent") %>" alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title mb-3">DOCUMENTO</h4>
                                </div>
                            </div>
                        </div>
<%--                        <div class="col-md-4">
                             <div class="card bordercolorinfo" style="border-radius:7px">
                                <img class="card-img-top" src="../Chip/Recibo/<%#Eval("Recibo") %>" alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title mb-3">RECIBO</h4>                                  
                                </div>
                            </div>
                        </div>--%>
                    </ItemTemplate>
                </asp:Repeater>
            </section>
        </form>
        <br />
    </div>
</asp:Content>
