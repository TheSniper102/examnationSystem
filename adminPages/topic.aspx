<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="topic.aspx.cs" Inherits="topic" %>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
        <ContentTemplate>

            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">

                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="172px" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" Width="366px">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:CommandField ShowEditButton="True" />
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:CommandField ShowDeleteButton="True" />
                            <asp:TemplateField HeaderText="Top_Id">
                                <EditItemTemplate>
                                    <asp:Label ID="lbl_edit_id" runat="server" Text='<%# Bind("Top_Id") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_design_id" runat="server" Text='<%# Bind("Top_Id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Top_Name">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_edit_name" runat="server" Text='<%# Bind("Top_Name") %>' Width="171px" CssClass="small_inpt"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_design_name" runat="server" Text='<%# Bind("Top_Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Crs_id">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddl_edit_crsid" runat="server" DataSourceID="SqlDataSource1" DataTextField="Crs_Name" DataValueField="Crs_Id" SelectedValue='<%# Bind("Crs_id") %>' CssClass="small_inpt">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<% $ConnectionStrings:Exam_Sys %>" SelectCommand="SELECT [Crs_Id], [Crs_Name] FROM [Course]"></asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_design_crsid" runat="server" Text='<%# Bind("Crs_id") %>'></asp:Label>
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
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="DeleteTopic" InsertMethod="insertTopic" SelectMethod="SelectAllTopic" TypeName="TopicBusinessLayer" UpdateMethod="editTopic">

                        <DeleteParameters>
                            <asp:Parameter Name="tid" Type="Int32" />
                            <asp:Parameter Name="crsid" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="tid" Type="Int32" />
                            <asp:Parameter Name="tname" Type="String" />
                            <asp:Parameter Name="crsid" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="tid" Type="Int32" />
                            <asp:Parameter Name="tname" Type="String" />
                            <asp:Parameter Name="crsid" Type="Int32" />
                        </UpdateParameters>
                    </asp:ObjectDataSource>

                    <asp:Button ID="cmdNext" runat="server" Text="insert topic" CommandName="NextView" CssClass="btn btn-primary btn-sm" />
                    <td style="width: 172px"></td>
                    <td></td>
                    <td colspan="2" style="width: 172px"></td>
                    </tr>
            <tr>
                <td colspan="10"></td>
            </tr>
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <!-- panel-->
                    <div class="row">
                        <div class="col-md-6">
                            <div class="box box-primary">
                                <div class="box-header">
                                    <h3 class="box-title">Insert Topic</h3>
                                </div>
                                <!-- /.box-header -->
                                <!-- form start -->
                                <form role="form">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <asp:Label ID="Label2" runat="server" Text="Topic Name" CssClass="pull-left"></asp:Label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txt_name" ForeColor="#CC0000" ValidationGroup="TopicData">*</asp:RequiredFieldValidator>
                                        </div>
                                        <div class="form-group">

                                            <asp:TextBox ID="txt_name" runat="server" class="form-control" CssClass="form-control col-xs-3 " ValidationGroup="TopicData"></asp:TextBox>

                                        </div>
                                        <div class="form-group">

                                            <asp:Label ID="Label1" runat="server" Text="Course name"></asp:Label>

                                        </div>
                                        <div class="form-group">

                                            <asp:DropDownList ID="ddl_crsid" runat="server" AutoPostBack="True" CssClass="form-control col-xs-3 " ValidationGroup="TopicData">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="lbl_res" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                    <!-- /.box-body -->

                                    <div class="box-footer topic-footer">
                                        <asp:Button ID="btn_insert" runat="server" Text="INSERT" OnClick="btn_insert_Click" ValidationGroup="TopicData" CssClass="btn btn-primary btn-sm" />
                                        <asp:Button ID="cmdPrev" runat="server" Text="Show Topic" CommandName="PrevView" CssClass="btn btn-primary btn-sm" />
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                    <%-- <asp:Label ID="lbl_select" runat="server"></asp:Label>--%>
                </asp:View>
            </asp:MultiView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

