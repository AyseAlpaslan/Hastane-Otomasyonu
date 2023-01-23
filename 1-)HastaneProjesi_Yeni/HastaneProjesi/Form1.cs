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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        SqlConnection con = new SqlConnection("server =DESKTOP-E4509IB;Database=Hastane_Proje;uid=sa;pwd=password1;");
        private void textBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            groupBox2.Visible = false;

        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            groupBox2.Visible = true;
            groupBox1.Visible = false;

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Secenekler yeni = new Secenekler();
            yeni.Show();
            this.Hide();
        }

        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            con.Open();         
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "OEkle";
            cmd.Parameters.AddWithValue("KullaniciAdi", textBox3.Text);
            cmd.Parameters.AddWithValue("Sifre", textBox4.Text);       
            cmd.Parameters.AddWithValue("Mail", textBox5.Text);
            cmd.Parameters.AddWithValue("Telefon", maskedTextBox1.Text);
            cmd.ExecuteNonQuery();    
            con.Close();
            groupBox1.Visible = true;
            groupBox2.Visible = false;


        }
    }
}
