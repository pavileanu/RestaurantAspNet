using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
        string username = CreateUserWizard1.UserName;
        Roles.AddUserToRole(username, "Member");
    }
    protected void Finish(object sender, WizardNavigationEventArgs e)
    {
        TextBox t1 = CreateUserWizard1.FindControl("TB_Nume") as TextBox;
        Profile.Nume = t1.Text;

        TextBox t2 = CreateUserWizard1.FindControl("TB_Prenume") as TextBox;
        Profile.Prenume = t2.Text;

        TextBox t3 = CreateUserWizard1.FindControl("TB_Data_nasterii") as TextBox;
        Profile.Data_nasterii = Convert.ToDateTime(t3.Text);

        RadioButtonList r = CreateUserWizard1.FindControl("RBL_Sex") as RadioButtonList;
        Profile.Sex = int.Parse(r.SelectedValue);

        TextBox t4 = CreateUserWizard1.FindControl("TB_Oras") as TextBox;
        Profile.Oras = t4.Text;
    }
    protected void Continue(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx");
    }
}