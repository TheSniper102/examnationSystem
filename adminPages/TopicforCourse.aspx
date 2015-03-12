<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="TopicforCourse.aspx.cs" Inherits="Topic_for_Each_Course" %>

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
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:CommandField ShowEditButton="True" />
                                    <asp:CommandField ShowDeleteButton="True" />
                                    <asp:TemplateField HeaderText="Top_Name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="ntoptexedt" runat="server" OnTextChanged="TextBox1_TextChanged" Text='<%# Bind("Top_Name") %>'></asp:TextBox>
                                        </EditItemTemplate>
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
                                            <asp:DropDownList ID="DDL_Crs" runat="server" DataSourceID="SqlDataSource111" DataTextField="Crs_Name" DataValueField="Crs_Id">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource111" runat="server" ConnectionString="<%$ ConnectionStrings:DepartmentSelect %>" SelectCommand="SELECT [Crs_Id], [Crs_Name] FROM [Course]"></asp:SqlDataSource>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="crslbdes" runat="server" Text='<%# Bind("Crs_id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
                        </tr>
                    </table>
                    <asp:Button ID="cmdNext" runat="server" Text="insert Topic" CommandName="NextView" CssClass="submit" />
                </asp:View>
                <asp:View ID="View2" runat="server">

                    <table style="width: 100%;">
                         <tr>
                            <td>
                                <asp:Label ID="lbl" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 262px">
                                <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
                            </td>
                            <td style="width: 384px">
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" Display="None" ErrorMessage="RequiredFieldValidator" SetFocusOnError="True" ValidationGroup="VG_insert">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 262px">
                                <asp:Label ID="Label2" runat="server" Text="Course_Id"></asp:Label>
                            </td>
                            <td style="width: 384px">
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Crs_Name" DataValueField="Crs_Id">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DepartmentSelect %>" SelectCommand="SELECT [Crs_Id], [Crs_Name] FROM [Course]"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 262px">&nbsp;</td>
                            <td style="width: 384px">
                                <asp:Button ID="Button1" runat="server" CssClass="four1" OnClick="Button1_Click" Text="Insert Topic" ValidationGroup="VG_insert" Width="95px" />
                            </td>
                        </tr>
                    </table>
                    <asp:Button ID="cmdPrev" runat="server" Text="Show Course Topics" CommandName="PrevView" CssClass="four1" />
                </asp:View>
            </asp:MultiView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

