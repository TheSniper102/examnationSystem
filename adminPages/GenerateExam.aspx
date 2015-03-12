<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="GenerateExam.aspx.cs" Inherits="GenerateExam" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table>
        <tr>
            <td>Choose course</td>
            <td>
                
                <asp:DropDownList ID="ddl_crs" runat="server" AppendDataBoundItems="true">
                    <asp:ListItem Value="0">--Choose Course--</asp:ListItem>
                </asp:DropDownList></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please choose course" ControlToValidate="ddl_crs" Display="Dynamic" ForeColor="#990000" InitialValue="0" SetFocusOnError="True" ValidationGroup="VG_gen">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Enter Start Date</td>
            <td>
                <asp:TextBox ID="txt_stdate" runat="server" TextMode="Date" Width="200px"></asp:TextBox>

            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter start date" Display="Dynamic" ForeColor="#990000" SetFocusOnError="True" ValidationGroup="VG_gen" ControlToValidate="txt_stdate">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Enter End Date</td>
            <td>
                <asp:TextBox ID="txt_enddate" runat="server" TextMode="Date" Width="200px"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" ErrorMessage="Please enter end date" ForeColor="#990000" SetFocusOnError="True" ValidationGroup="VG_gen" ControlToValidate="txt_enddate">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txt_stdate" ControlToValidate="txt_enddate" Display="Dynamic" ErrorMessage="please make end date after start date" ForeColor="#990000" Operator="GreaterThan" Type="Date" ValidationGroup="VG_gen">*</asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td>MCQ Questions Number</td>
            <td>
                <asp:TextBox ID="txt_mcq" runat="server" TextMode="Number" Width="200px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="Dynamic" ErrorMessage="Please enter MCQ questions number" ForeColor="#990000" SetFocusOnError="True" ValidationGroup="VG_gen" ControlToValidate="txt_mcq">*</asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txt_mcq" Display="Dynamic" ErrorMessage="mcq number must be between 0 and 10" ForeColor="#990000" Type="Integer" ValidationGroup="VG_gen" MaximumValue="10" MinimumValue="0">*</asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td>True/False Questions Number</td>
            <td>

                <asp:TextBox ID="txt_tf" runat="server" TextMode="Number" Width="200px"></asp:TextBox>


            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Display="Dynamic" ErrorMessage="Please enter True/False questions number" ForeColor="#990000" SetFocusOnError="True" ValidationGroup="VG_gen" ControlToValidate="txt_tf">*</asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txt_tf" Display="Dynamic" ErrorMessage="true/false  number must be between 0 and 10" ForeColor="#990000" Type="Integer" ValidationGroup="VG_gen" MaximumValue="10" MinimumValue="0">*</asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="btn_generate" runat="server" Text="Generate" Width="200px" OnClick="btn_generate_Click" ValidationGroup="VG_gen" CssClass="four1" />
            </td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Image ID="img_res" runat="server" Width="20" Height="20" ImageUrl="~/images/ok_16x16.gif" Visible="False" />
                <asp:Label ID="lbl_res" runat="server" Font-Italic="True" Font-Size="Medium"></asp:Label></td>
            <td></td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Italic="True" Font-Size="Medium" ForeColor="#990000" ValidationGroup="VG_gen" Style="margin-left: 200px;" />
</asp:Content>

