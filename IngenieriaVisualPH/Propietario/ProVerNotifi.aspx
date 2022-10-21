<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="ProVerNotifi.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web163" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
       <link href="../Diseño/Color.css" rel="stylesheet" />
    <div class="container">
        <form id="form1" runat="server">
            <asp:Label ID="lblcodigo" runat="server" Text="" Visible="false"></asp:Label>
            <br />
            <div class=" colxs-6 col-md-6">
                <div class="card" style="border-radius: 7px">
                    <div class="card-header">
                        <strong class="card-title font-weight-bold">Asunto:&nbsp;<asp:Label ID="lblasuto" runat="server"></asp:Label>
                        </strong>
                    </div>
                    <div class="card-body">
                        <div>
                            <asp:Label ID="lblmsg" runat="server"></asp:Label>
                        </div>
                        <div>
                            <br />
                            <p>
                                <asp:Label ID="lblfecha" runat="server" Text="" Font-Size="Medium"></asp:Label>
                            </p>
                        </div>
                        <section>
                            <asp:Repeater ID="r1" Visible="false" runat="server">
                                <ItemTemplate>
                                    <div class="col-sm-4">
                                        <a href="ProVerNotiPDF.aspx?Id=<%#Eval("DocNotificacion")%>">
                                            <button class="btn btn-primary font-weight-bold" type="button" style="border-radius: 5px" title="Descargar Documento">Descargar Documento&nbsp;<i class="fa fa-download"></i></button>
                                        </a>
                                    </div>
                                    <div>
                                        <br />
                                        &nbsp;
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </section>
                    </div>
                </div>
            </div>
        </form>
    </div>
 
</asp:Content>
