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
    public partial class Poliklinik : Form
    {
        public Poliklinik()
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
            cmd.CommandText = "PEkle";       
            cmd.Parameters.AddWithValue("PoliklinikAdi", textBox2.Text);
            cmd.Parameters.AddWithValue("PoliklinikUzmanSayisi", textBox3.Text);
            cmd.Parameters.AddWithValue("PoliklinikBaskanı", textBox4.Text);
            cmd.Parameters.AddWithValue("PoliklinikBasHemsire", textBox5.Text);
            cmd.Parameters.AddWithValue("YatakSayisi", textBox6.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Goster();

            
        }
        public void Goster()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PListele";
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
            cmd.CommandText = "PGuncelle";
            cmd.Parameters.AddWithValue("PoliklinikNo", textBox1.Text);
            cmd.Parameters.AddWithValue("PoliklinikAdi", textBox2.Text);
            cmd.Parameters.AddWithValue("PoliklinikUzmanSayisi", textBox3.Text);
            cmd.Parameters.AddWithValue("PoliklinikBaskanı", textBox4.Text);
            cmd.Parameters.AddWithValue("PoliklinikBasHemsire", textBox5.Text);
            cmd.Parameters.AddWithValue("YatakSayisi", textBox6.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Goster();
        }

        private void button1_Click(object sender, EventArgs e)
        {
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
            textBox1.Text = satir.Cells["PoliklinikNo"].Value.ToString();
            textBox2.Text = satir.Cells["PoliklinikAdi"].Value.ToString();
            textBox3.Text = satir.Cells["PoliklinikUzmanSayisi"].Value.ToString();    
            textBox4.Text = satir.Cells["PoliklinikBaskanı"].Value.ToString();
            textBox5.Text = satir.Cells["PoliklinikBasHemsire"].Value.ToString();
            textBox6.Text = satir.Cells["YatakSayisi"].Value.ToString();

        }
    }
}
