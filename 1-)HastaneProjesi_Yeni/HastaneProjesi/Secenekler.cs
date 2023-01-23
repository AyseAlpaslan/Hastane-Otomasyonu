using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace HastaneProjesi
{
    public partial class Secenekler : Form
    {
        public Secenekler()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {
            Poliklinik yeni = new Poliklinik();
            yeni.Show();
            this.Hide();
        }

        private void label2_Click(object sender, EventArgs e)
        {
            Doktorlar yeni = new Doktorlar();
            yeni.Show();
            this.Hide();
        }

        private void label3_Click(object sender, EventArgs e)
        {
            Hastalar yeni = new Hastalar();
            yeni.Show();
            this.Hide();
        }

        private void label4_Click(object sender, EventArgs e)
        {
            Rapor yeni = new Rapor();
            yeni.Show();
            this.Hide();
        }
    }
}
