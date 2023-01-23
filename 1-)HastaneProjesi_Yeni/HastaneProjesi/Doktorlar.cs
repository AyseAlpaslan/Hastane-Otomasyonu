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

//Ibb2022#!
namespace HastaneProjesi
{
    public partial class Doktorlar : Form
    {
        public Doktorlar()
        {
            InitializeComponent();
        }
        SqlConnection con = new SqlConnection("server =DESKTOP-E4509IB;Database=Hastane_Proje;uid=sa;pwd=password1;");


        private void button1_Click(object sender, EventArgs e)
        {
            Goster();
        }

        public void Goster()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "DListele";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView1.DataSource = dt;

        }

        private void pictureBox3_Click(object sender, EventArgs e)
        {

            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "DEkle";
            cmd.Parameters.AddWithValue("DoktorAdSoyad", textBox1.Text);
            cmd.Parameters.AddWithValue("DoktorTcNo", textBox2.Text);
            cmd.Parameters.AddWithValue("UzmanlıkAlanı", textBox3.Text);
            cmd.Parameters.AddWithValue("Unvanı", textBox4.Text);
            cmd.Parameters.AddWithValue("TelefonNumarası", textBox5.Text);
            cmd.Parameters.AddWithValue("Adres", textBox6.Text);
            cmd.Parameters.AddWithValue("DogumTarihi", textBox7.Text);
            cmd.Parameters.AddWithValue("PoliklinikNo", textBox8.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Goster();
        }

        private void pictureBox4_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "DGuncelle";
            cmd.Parameters.AddWithValue("DoktorNo", textBox9.Text);
            cmd.Parameters.AddWithValue("DoktorAdSoyad", textBox1.Text);
            cmd.Parameters.AddWithValue("DoktorTcNo", textBox2.Text);
            cmd.Parameters.AddWithValue("UzmanlıkAlanı", textBox3.Text);
            cmd.Parameters.AddWithValue("Unvanı", textBox4.Text);
            cmd.Parameters.AddWithValue("TelefonNumarası", textBox5.Text);
            cmd.Parameters.AddWithValue("Adres", textBox6.Text);
            cmd.Parameters.AddWithValue("DogumTarihi", textBox7.Text);
            cmd.Parameters.AddWithValue("PoliklinikNo", textBox8.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Goster();
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            Secenekler yeni = new Secenekler();
            yeni.Show();
            this.Hide();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;
            textBox9.Text = satir.Cells["DoktorNo"].Value.ToString();
            textBox1.Text = satir.Cells["DoktorAdSoyad"].Value.ToString();
            textBox2.Text = satir.Cells["DoktorTcNo"].Value.ToString();
            textBox3.Text = satir.Cells["UzmanlıkAlanı"].Value.ToString();
            textBox4.Text = satir.Cells["Unvanı"].Value.ToString();
            textBox5.Text = satir.Cells["Adres"].Value.ToString();
            textBox6.Text = satir.Cells["DogumTarihi"].Value.ToString();
            textBox7.Text = satir.Cells["PoliklinikNo"].Value.ToString();

        }

        private void label11_Click(object sender, EventArgs e)
        {

        }

        private void Doktorlar_Load(object sender, EventArgs e)
        {

        }
    }
}
