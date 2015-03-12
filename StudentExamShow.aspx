<%@ Page Title="" Language="C#" MasterPageFile="~/StudentMaster.master" AutoEventWireup="true" CodeFile="StudentExamShow.aspx.cs" Inherits="StudentExamShow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="st_container">
        
            <header>
                Current Exames
            </header>
            <asp:DataList ID="DataList_ShowExam" runat="server" CellPadding="4" Width="100%" Height="192px" ForeColor="#333333">
                <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" CssClass="hlStyle" Text="you have an exam in "  style="margin:0;"></asp:Label>
                       <asp:Label ID="Label2" runat="server" CssClass="hlStyle" Text='<%# Bind("Crs_Name")%>' style="margin:0;"></asp:Label>
                       <asp:Label ID="Label3" runat="server" CssClass="hlStyle" Text="from " style="margin:0;"></asp:Label>
                       <asp:Label ID="Label4" runat="server" CssClass="hlStyle" Text='<%# Bind("[Start_date]") %>' style="margin:0;"></asp:Label>
                     <asp:Label ID="Label5" runat="server" CssClass="hlStyle" Text=" to " style="margin:0;"></asp:Label>
                     <asp:Label ID="Label6" runat="server" CssClass="hlStyle" Text='<%# Bind("End_date")  %>' style="margin:0;"></asp:Label>
                    <asp:HyperLink ID="hl_exam" runat="server"  style="margin:0;" Text="Click Here To Go To Exam" CssClass="four1"></asp:HyperLink>
                    <asp:Label ID="lbl_ex" runat="server" Text='<%# Bind("C_id") %>' Visible="false"></asp:Label>   
                </ItemTemplate>
                <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            </asp:DataList>
    <asp:Label ID="lbl" runat="server" Text="" CssClass="hlStyle"></asp:Label>
    </div>
</asp:Content>

