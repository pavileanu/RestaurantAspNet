using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Edit_profile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            TextBox t1 = LoginView1.FindControl("TB_Nume") as TextBox;
            if (t1 != null)
                t1.Text = Profile.Nume;

            TextBox t2 = LoginView1.FindControl("TB_Prenume") as TextBox;
            if (t2 != null)
                t2.Text = Profile.Prenume;

            TextBox t3 = LoginView1.FindControl("TB_Data_nasterii") as TextBox;
            if (t3 != null)
                t3.Text = Profile.Data_nasterii.ToShortDateString();

            RadioButtonList r = LoginView1.FindControl("RBL_Sex") as RadioButtonList;
            if(r != null)
                r.SelectedValue = Profile.Sex.ToString();

            TextBox t4 = LoginView1.FindControl("TB_Oras") as TextBox;
            if (t4 != null)
                t4.Text = Profile.Oras;
        }
    }
    protected void Modifica(object sender, EventArgs e)
    {
        TextBox t1 = LoginView1.FindControl("TB_Nume") as TextBox;
        Profile.Nume = t1.Text;

        TextBox t2 = LoginView1.FindControl("TB_Prenume") as TextBox;
        Profile.Prenume = t2.Text;

        TextBox t3 = LoginView1.FindControl("TB_Data_nasterii") as TextBox;
        Profile.Data_nasterii=Convert.ToDateTime(t3.Text);

        RadioButtonList r = LoginView1.FindControl("RBL_Sex") as RadioButtonList;
        Profile.Sex = int.Parse(r.SelectedValue);

        TextBox t4 = LoginView1.FindControl("TB_Oras") as TextBox;
        Profile.Oras=t4.Text;
    }
}