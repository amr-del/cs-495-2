<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<script runat="server">

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        
        // Create Connection Object
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|EgyptAir.mdf;Integrated Security=True";

        // Create SQL Insert Statement
        string strInsert = "INSERT INTO Member "
            + " VALUES('" + txtFname.Text + "', '"
            + txtLname.Text + "', '"
            + rblSex.SelectedValue + "', '"
            + txtEmail.Text + "', '"
            + txtPhone.Text + "', '"
            + ddlCountry.SelectedValue + "', '"
            + txtUsername.Text + "', '"
            + txtPassword.Text + "')";
        
        // Create SQL Command
        SqlCommand cmdInsert = new SqlCommand(strInsert, conn);

    try{

        conn.Open();

        cmdInsert.ExecuteNonQuery();

        conn.Close();

        lblMsg.Text = "Welcome " + txtFname.Text +  "Your Account Has Been Successfully Created!!";
          
       } 
    
      catch (SqlException ex){
    
        if(ex.Number == 2627)  
          lblMsg.Text = "Choose another name because it is alreade exists";

        else
          lblMsg.Text = "Error in database, try it again later";
    }

    catch{
      
       lblMsg.Text = "Error in System, pls try it again later";

    }
    
            
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
        }
        .auto-style3 {
            width: 117px;
            height: 23px;
        }
        .auto-style4 {
            height: 23px;
        }
        .auto-style5 {
            width: 210px;
        }
        .auto-style6 {
            height: 23px;
            width: 210px;
        }
        .auto-style7 {
            width: 161px;
        }
        .auto-style8 {
            width: 161px;
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Font-Names="Monotype Corsiva" Font-Size="X-Large" ForeColor="#000066" Text="To Create An Account, Fill In All the Following Fields, Then Click Submit:"></asp:Label>
        <br />
        <br />
        <br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label2" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" Text="First Name:"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtFname" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" Width="163px"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFname" ErrorMessage="First Name is Missing!!"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label3" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" Text="Last Name:"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtLname" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" Width="163px"></asp:TextBox>
                </td>
                <td class="auto-style7">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label4" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" Text="Sex:"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:RadioButtonList ID="rblSex" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="M">Male</asp:ListItem>
                        <asp:ListItem Value="F">Female</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td class="auto-style7">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label5" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" Text="Email Address:"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtEmail" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" Width="163px"></asp:TextBox>
                </td>
                <td class="auto-style7">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label6" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" Text="Phone Number:"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtPhone" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" Width="163px"></asp:TextBox>
                </td>
                <td class="auto-style7">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label7" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" Text="Country:"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:DropDownList ID="ddlCountry" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066">
                        <asp:ListItem Selected="True">Egypt</asp:ListItem>
                        <asp:ListItem>Sudan</asp:ListItem>
                        <asp:ListItem>Syria</asp:ListItem>
                        <asp:ListItem>Italy</asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>France</asp:ListItem>
                        <asp:ListItem>Spain</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style8"></td>
                <td class="auto-style4"></td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label8" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" Text="Username:"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtUsername" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" Width="163px"></asp:TextBox>
                </td>
                <td class="auto-style7">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label9" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" Text="Password:"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtPassword" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" Width="163px" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style8"></td>
                <td class="auto-style4"></td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label10" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" Text="Retype Password:"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="RetypePass" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" Width="163px" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style7">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="btnSubmit" runat="server" Font-Names="Arial Black" Font-Size="Medium" ForeColor="#000066" OnClick="btnSubmit_Click" Text="Submit" />
                </td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="4">
    
        <asp:Label ID="lblMsg" runat="server" Font-Names="Monotype Corsiva" Font-Size="X-Large" ForeColor="#CC0000"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
