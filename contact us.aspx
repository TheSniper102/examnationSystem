<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="contact us.aspx.cs" Inherits="_Default" %>

<%-- Add content controls here --%>

<asp:Content runat="server" ID="content1" ContentPlaceHolderID="ContentPlaceHolder1">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
        <ContentTemplate>

    <table style="width: 100%">
        <tr>
            <td style="width: 187px; height: 31px">Email</td>
            <td style="height: 31px">
                <asp:TextBox ID="txt_email" runat="server" Width="119px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_email" ErrorMessage="RequiredFieldValidator" ValidationGroup="nana">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 187px; height: 31px">FullName</td>
            <td style="height: 31px">
                <asp:TextBox ID="txt_name" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_name" ErrorMessage="RequiredFieldValidator" ValidationGroup="nana">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 187px; height: 35px">Phone</td>
            <td style="height: 35px">
                <asp:TextBox ID="txt_phone" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 187px; height: 39px">Message</td>
            <td style="height: 39px">
                <asp:TextBox ID="txt_message" runat="server" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_message" ErrorMessage="RequiredFieldValidator" ValidationGroup="nana">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="height: 63px" colspan="2">
                <asp:Button ID="btn_contact" runat="server" Text="Contact us" Width="164px" OnClick="btn_contact_Click" ValidationGroup="nana" CssClass="four1" />
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
       </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
 