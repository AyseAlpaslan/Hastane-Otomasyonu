using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace HastaneProjesi
{

    public partial class Rapor : Form
    {
        public Rapor()
        {
            InitializeComponent();
        }
        SqlConnection con = new SqlConnection("server =DESKTOP-E4509IB;Database=Hastane_Proje;uid=sa;pwd=password1;");

        private void Rapor_Load(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand komut = new SqlCommand("select * From Doktor", con);
            SqlDataReader dr;
            dr = komut.ExecuteReader();
            while (dr.Read())
            {
                comboBox1.Items.Add(dr["DoktorNo"]);
            }
            con.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand sorgu = new SqlCommand();
            sorgu.Connection = con;
            sorgu.CommandType = CommandType.StoredProcedure;
            sorgu.CommandText = "Uzman";

            SqlDataAdapter dr = new SqlDataAdapter(sorgu);
            DataTable doldur = new DataTable();
            dr.Fill(doldur);
            dataGridView1.DataSource = doldur;
            con.Close();
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            Secenekler yeni = new Secenekler();
            yeni.Show();
            this.Hide();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand sorgu = new SqlCommand();
            sorgu.Connection = con;
            sorgu.CommandType = CommandType.StoredProcedure;
            sorgu.CommandText = "Ortak";

            SqlDataAdapter dr = new SqlDataAdapter(sorgu);
            DataTable doldur = new DataTable();
            dr.Fill(doldur);
            dataGridView1.DataSource = doldur;
            con.Close();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand sorgu = new SqlCommand();
            sorgu.Connection = con;
            sorgu.CommandType = CommandType.StoredProcedure;
            sorgu.CommandText = "Dno";
            sorgu.Parameters.AddWithValue("DoktorNo", comboBox1.Text);

            SqlDataAdapter dr = new SqlDataAdapter(sorgu);
            DataTable doldur = new DataTable();
            dr.Fill(doldur);
            dataGridView1.DataSource = doldur;
            con.Close();
        }
    }
}
