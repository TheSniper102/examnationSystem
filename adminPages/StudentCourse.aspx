<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="StudentCourse.aspx.cs" Inherits="StudentCourse" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td>Choose student</td>
            <td>
                <asp:DropDownList ID="ddl_student" runat="server" ></asp:DropDownList></td>
        </tr>
        <tr >
            <td style="vertical-align:top;">Mark student courses<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="lbx_crs" Display="Dynamic" ErrorMessage="please select course" ForeColor="#990000" SetFocusOnError="True">*</asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:ListBox ID="lbx_crs" runat="server" Height="89px" SelectionMode="Multiple" Width="113px"></asp:ListBox></td>
        </tr>
        <tr>
            <td>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List" Font-Italic="True" Font-Size="Medium" ForeColor="#990000" />
            </td>
            <td>
                <asp:Button ID="btn_save" runat="server" Text="Save" Height="29px" OnClick="btn_save_Click" Width="108px" CssClass="four1" />
                <br />
                <br />
                <asp:Image ID="img_result" runat="server" Height="20" ImageUrl="~/images/ok_16x16.gif" Visible="false" Width="20" />
                <asp:Label ID="lbl_res" runat="server" Font-Italic="True" Font-Size="Medium" ForeColor="#009933"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
</asp:Content>

