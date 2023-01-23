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
    public partial class Hastalar : Form
    {
        public Hastalar()
        {
            InitializeComponent();
        }
        SqlConnection con = new SqlConnection("server =DESKTOP-E4509IB;Database=Hastane_Proje;uid=sa;pwd=password1;");


        private void pictureBox3_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HEkle";
            cmd.Parameters.AddWithValue("HastaAdSoyad", textBox2.Text);
            cmd.Parameters.AddWithValue("HastaTcNo", textBox3.Text);
            cmd.Parameters.AddWithValue("DogumTarihi", textBox4.Text);
            cmd.Parameters.AddWithValue("Boy", textBox5.Text);
            cmd.Parameters.AddWithValue("Yas", textBox6.Text);
            cmd.Parameters.AddWithValue("Recete", textBox7.Text);
            cmd.Parameters.AddWithValue("RaporDurumu", textBox8.Text);
            cmd.Parameters.AddWithValue("RandevuTarihi", textBox9.Text);
            cmd.Parameters.AddWithValue("DoktorNo", textBox10.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Goster();
           
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Goster();
        }
        public void Goster()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HListele";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView1.DataSource = dt;

        }

        private void pictureBox4_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HGuncelle";
            cmd.Parameters.AddWithValue("HastaNo", textBox1.Text);
            cmd.Parameters.AddWithValue("HastaAdSoyad", textBox2.Text);
            cmd.Parameters.AddWithValue("HastaTcNo", textBox3.Text);
            cmd.Parameters.AddWithValue("DogumTarihi", textBox4.Text);
            cmd.Parameters.AddWithValue("Boy", textBox5.Text);
            cmd.Parameters.AddWithValue("Yas", textBox6.Text);
            cmd.Parameters.AddWithValue("Recete", textBox7.Text);
            cmd.Parameters.AddWithValue("RaporDurumu", textBox8.Text);
            cmd.Parameters.AddWithValue("RandevuTarihi", textBox9.Text);
            cmd.Parameters.AddWithValue("DoktorNo", textBox10.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Goster();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;
            textBox1.Text = satir.Cells["HastaNo"].Value.ToString();
            textBox2.Text = satir.Cells["HastaAdSoyad"].Value.ToString();
            textBox3.Text = satir.Cells["HastaTcNo"].Value.ToString();
            textBox4.Text = satir.Cells["DogumTarihi"].Value.ToString();
            textBox5.Text = satir.Cells["Boy"].Value.ToString();
            textBox6.Text = satir.Cells["Yas"].Value.ToString();
            textBox7.Text = satir.Cells["Recete"].Value.ToString();
            textBox8.Text = satir.Cells["RaporDurumu"].Value.ToString();
            textBox9.Text = satir.Cells["RandevuTarihi"].Value.ToString();
            textBox10.Text = satir.Cells["DoktorNo"].Value.ToString();
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            Secenekler yeni = new Secenekler();
            yeni.Show();
            this.Hide();
        }
    }
}
