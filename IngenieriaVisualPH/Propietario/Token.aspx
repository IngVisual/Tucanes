<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="Token.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
    <link href="../Diseño/Color.css" rel="stylesheet" />
   <p id="result"></p>
  <script>
    OneSignal.push(function () {
            OneSignal.getUserId(function (userId) {
                console.log(typeof "OneSignal User ID:", userId);
                var user = (userId).toString();
                localStorage.setItem("varpush", user );
                document.getElementById("result").innerHTML = localStorage.getItem('varpush');
                window.location.href = "TokenOK.aspx?value=" + localStorage.getItem('varpush');
            });
      });
   </script>
    <form id="form1" runat="server">
        <asp:Label ID="lblcodigo" runat="server" Visible="false"></asp:Label>
    </form>
</asp:Content>
