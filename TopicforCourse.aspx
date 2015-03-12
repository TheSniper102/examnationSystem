<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TopicforCourse.aspx.cs" Inherits="Topic_for_Each_Course" %>

<%-- Add content controls here --%>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">
                    <table>
                       
                        <tr>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text="Choose Course"></asp:Label></td>
                            <td style="width: 146px">
                                <asp:DropDownList ID="ddl_topic" runat="server" OnSelectedIndexChanged="ddl_topic_SelectedIndexChanged"></asp:DropDownList></td>
                            <td>
                                <asp:Button ID="btn_show" runat="server" Text="Show" OnClick="btn_show_Click" CssClass="submit" Width="77px" />
                            </td>
                        </tr>
                        <tr>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  CellPadding="4" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Top_Name">
                                       
                                        <ItemTemplate>
                                            <asp:Label ID="ntoplbdes" runat="server" Text='<%# Bind("Top_Name") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Top_Id">
                                        <EditItemTemplate>
                                            <asp:Label ID="toplbedt" runat="server" Text='<%# Bind("Top_Id") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="toplbdes" runat="server" Text='<%# Bind("Top_Id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Crs_Id">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="crstexedt" runat="server" Text='<%# Bind("Crs_id") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="crslbdes" runat="server" Text='<%# Bind("Crs_id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EditRowStyle BackColor="#7C6F57" />
                                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#E3EAEB" />
                                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                            </asp:GridView>
                        </tr>
                    </table>
                </asp:View>
            </asp:MultiView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

