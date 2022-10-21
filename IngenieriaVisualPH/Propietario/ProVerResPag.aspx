<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="ProVerResPag.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web120" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
<link href="../Diseño/Color.css" rel="stylesheet" />
    <div class="container">
        <h3 class="text-center textocolorinfo font-weight-bold ">Respuesta&nbsp;&nbsp;<span class="badge badge-primary mt-1"><asp:Label ID="lblestado" runat="server" Text=""></asp:Label></span></h3>
        <br />
        <form id="form1" runat="server">
            <section>
                <asp:Repeater ID="r2" Visible="false" runat="server">
                    <ItemTemplate>
                        <div class="col-sm-4">
                            <a href="ProVerResPagPDF.aspx?Id=<%#Eval("NovedadImagen")%>">
                                <button class="btncolorinfo font-weight-bold" type="button" style="border-radius: 5px" title="Descargar Documento">Descargar Documento&nbsp;<i class="fa fa-download"></i></button>
                            </a>
                        </div>
                        <div>
                            <br />
                            &nbsp;</div>
                    </ItemTemplate>
                </asp:Repeater>
            </section>
            <section>
                <br />
                <div class="col-md-6">
                    <div class="card bordercolorinfo" style="border-radius: 5px">
                        <div class="card-header">
                            <strong class="card-title">Observacion--<asp:Label ID="lblfecini" runat="server" Text=""></asp:Label></strong>
                        </div>
                        <div class="card-body">
                            <p class="card-text">
                                <asp:Label ID="lbldescri" runat="server" Text=""></asp:Label>
                            </p>
                        </div>
                    </div>
                    <br />
                    <div class="card bordercolorinfo" style="border-radius: 5px">
                        <div class="card-header">
                            <strong class="card-title">Respuesta--<asp:Label ID="lblfechres" runat="server" Text=""></asp:Label></strong>
                        </div>
                        <div class="card-body">
                            <p class="card-text">
                                 <asp:Label ID="lblresp" CssClass="textocolorinfo" runat="server" Text=""></asp:Label>
                            </p>
                        </div>
                    </div>

                </div>
                <div>
                </div>
            </section>
            <section>
                <asp:Repeater ID="r1" runat="server">
                    <ItemTemplate>
                        <div class="col-md-4">
                            <div class="card bordercolorinfo" style="border-radius:5px">
                                <img class="card-img-top" src="../NovedadSaldos/<%#Eval("Nombre") %>" alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title mb-3">Recibo</h4>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </section>
        </form>
        <br />
    </div>
</asp:Content>
