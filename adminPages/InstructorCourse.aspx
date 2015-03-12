<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="InstructorCourse.aspx.cs" Inherits="InstructorCourse" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <table>
        <tr>
            <td>Choose Instructor</td>
            <td>
                <asp:DropDownList ID="ddl_inst" runat="server"></asp:DropDownList></td>
        </tr>
        <tr>
            <td style="vertical-align:top">assign courses<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="please select course" ControlToValidate="lbx_crs" Display="Dynamic" ForeColor="#990000" SetFocusOnError="True">*</asp:RequiredFieldValidator>
            </td>
            <td style="vertical-align:top">
                <asp:ListBox ID="lbx_crs" runat="server" Height="89px" SelectionMode="Multiple" Width="113px"></asp:ListBox>
            </td>
        </tr>
        <tr>
            <td >
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List" Font-Italic="True" Font-Size="Medium" ForeColor="#990000" />
            </td>
            <td>
                <asp:Button ID="btn_save" runat="server" Text="Save" Height="29px"  Width="108px" OnClick="btn_save_Click" CssClass="four1" />
                <br />
                <br />
                <asp:Image ID="img_result" runat="server" Height="20" ImageUrl="~/images/ok_16x16.gif" Visible="false" Width="20" />
                <asp:Label ID="lbl_res" runat="server" Font-Italic="True" Font-Size="Medium" ForeColor="#009933"></asp:Label>
            </td>
        </tr>
    </table>

</asp:Content>

