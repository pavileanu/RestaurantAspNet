using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Insert : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Adauga(object sender, EventArgs e)
    {

        try
        {
            SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True");
            con.Open();
            string cmd_string = "INSERT INTO [RESTAURANT] ([NUME], [RATING], [LOCATIE], [DATA_DESCHIDERII], [ID_SPECIFIC]) VALUES (@NUME, @RATING, @LOCATIE, @DATA_DESCHIDERII,@ID_SPECIFIC)";
            SqlCommand cmd = new SqlCommand(cmd_string, con);

            cmd.Parameters.AddWithValue("@NUME", TB_NUME.Text);
            cmd.Parameters.AddWithValue("@RATING", int.Parse(TB_RATING.Text));
            cmd.Parameters.AddWithValue("@LOCATIE", TB_LOCATIE.Text);
            cmd.Parameters.AddWithValue("@DATA_DESCHIDERII", Convert.ToDateTime(TB_DATA_DESCHIDERII.Text));
            cmd.Parameters.AddWithValue("@ID_SPECIFIC", int.Parse(DDL_SPECIFIC.SelectedValue));
            try
            {
                cmd.ExecuteNonQuery();
                Session["Message"] = "Datele au fost inserate!";
                Response.Redirect("~/Default.aspx");
            }
            catch (Exception ex)
            {
                Raspuns.Text = " Eroare la inserare : " + ex.Message;
            }
            con.Close();
        }
        catch (Exception ex)
        {
            Raspuns.Text = " Eroare la conexiune sau conversia datelor : " + ex.Message;
        }
       
    }
}