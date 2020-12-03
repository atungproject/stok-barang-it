<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Alokasi extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        cek_login();

        $this->load->model('Admin_model', 'admin');
        $this->load->library('form_validation');
    }

    public function index()
    {
        $data['title'] = "Alokasi";
        $data['alokasi'] = $this->admin->getAlokasi();
        $this->template->load('templates/dashboard', 'alokasi/data', $data);
    }

    private function _validasi()
    {
        $this->form_validation->set_rules('dep', 'Departement Alokasi', 'required|trim');
        // $this->form_validation->set_rules('role', 'Kategori', 'required');
        // $this->form_validation->set_rules('satuan_id', 'Satuan Barang', 'required');
    }

    public function add()
    {
        $this->_validasi();

        if ($this->form_validation->run() == false) {
            $data['title'] = "Alokasi";
            // $data['jenis'] = $this->admin->get('jenis');
            // $data['satuan'] = $this->admin->get('satuan');

            // Mengenerate ID alokasi
            $kode_terakhir = $this->admin->getMax('alokasi', 'id_alokasi');
            $kode_tambah = substr($kode_terakhir, -6, 6);
            $kode_tambah++;
            $number = str_pad($kode_tambah, 6, '0', STR_PAD_LEFT);
            $data['id_alokasi'] = 'A' . $number;

            $this->template->load('templates/dashboard', 'alokasi/add', $data);
        } else {
            $input = $this->input->post(null, true);
            $insert = $this->admin->insert('alokasi', $input);

            if ($insert) {
                set_pesan('data berhasil disimpan');
                redirect('alokasi');
            } else {
                set_pesan('gagal menyimpan data');
                redirect('alokasi/add');
            }
        }
    }

    public function edit($getId)
    {
        $id = encode_php_tags($getId);
        $this->_validasi();

        if ($this->form_validation->run() == false) {
            $data['title'] = "Alokasi";
            $data['alokasi'] = $this->admin->get('alokasi', ['id_alokasi' => $id]);
            $this->template->load('templates/dashboard', 'alokasi/edit', $data);
        } else {
            $input = $this->input->post(null, true);
            $update = $this->admin->update('alokasi', 'id_alokasi', $id, $input);

            if ($update) {
                set_pesan('data berhasil disimpan');
                redirect('alokasi');
            } else {
                set_pesan('gagal menyimpan data');
                redirect('alokasi/edit/' . $id);
            }
        }
    }

    public function delete($getId)
    {
        $id = encode_php_tags($getId);
        if ($this->admin->delete('alokasi', 'id_alokasi', $id)) {
            set_pesan('data berhasil dihapus.');
        } else {
            set_pesan('data gagal dihapus.', false);
        }
        redirect('alokasi');
    }

    public function getstok($getId)
    {
        $id = encode_php_tags($getId);
        $query = $this->admin->cekStok($id);
        output_json($query);
    }
}
