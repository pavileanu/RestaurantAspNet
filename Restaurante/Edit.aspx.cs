using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Edit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack && Request.Params["id"] != null)
        {
            try
            {
                int id = Convert.ToInt32(Request.Params["id"]);
                SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True");
                con.Open();
                string cmd_string = "SELECT NUME,RATING,LOCATIE,DATA_DESCHIDERII,ID_SPECIFIC FROM RESTAURANT WHERE ID_RESTAURANT = @ID ";
                SqlCommand cmd = new SqlCommand(cmd_string, con);
                cmd.Parameters.AddWithValue("ID", id);

                try
                {
                    SqlDataReader r = cmd.ExecuteReader();
                    while (r.Read())
                    {
                        TB_NUME.Text = r["NUME"].ToString();
                        TB_LOCATIE.Text = r["LOCATIE"].ToString();
                        TB_RATING.Text = r["RATING"].ToString();
                        TB_DATA_DESCHIDERII.Text = r["DATA_DESCHIDERII"].ToString();
                        DDL_SPECIFIC.SelectedValue = r["ID_SPECIFIC"].ToString();
                    }

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

    protected void Update(object sender, EventArgs e)
    {


        try
        {
            int id = Convert.ToInt32(Request.Params["id"]);
            SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True");
            con.Open();
            string cmd_string = "UPDATE [RESTAURANT] Set [NUME] = @NUME, [RATING] = @RATING, [LOCATIE] = @LOCATIE , [DATA_DESCHIDERII] = @DATA_DESCHIDERII, [ID_SPECIFIC] = @ID_SPECIFIC WHERE [ID_RESTAURANT] = @ID_RESTAURANT";
            SqlCommand cmd = new SqlCommand(cmd_string, con);

            cmd.Parameters.AddWithValue("@ID_RESTAURANT", id);
            cmd.Parameters.AddWithValue("@NUME", TB_LOCATIE.Text);
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