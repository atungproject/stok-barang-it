<div class="row justify-content-center">
    <div class="col-md-8">
        <div class="card shadow-sm border-bottom-primary">
            <div class="card-header bg-white py-3">
                <div class="row">
                    <div class="col">
                        <h4 class="h5 align-middle m-0 font-weight-bold text-primary">
                            Form Tambah Alokasi
                        </h4>
                    </div>
                    <div class="col-auto">
                        <a href="<?= base_url('alokasi') ?>" class="btn btn-sm btn-secondary btn-icon-split">
                            <span class="icon">
                                <i class="fa fa-arrow-left"></i>
                            </span>
                            <span class="text">
                                Kembali
                            </span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <?= $this->session->flashdata('pesan'); ?>
                <?= form_open(''); ?>
                <div class="row form-group">
                    <label class="col-md-3 text-md-right" for="id_alokasi">ID Alokasi</label>
                    <div class="col-md-9">
                        <input readonly value="<?= set_value('id_alokasi', $id_alokasi); ?>" name="id_alokasi" id="id_alokasi" type="text" class="form-control" placeholder="ID Alokasi...">
                        <?= form_error('id_alokasi', '<small class="text-danger">', '</small>'); ?>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-3 text-md-right" for="dep">Departemen</label>
                    <div class="col-md-9">
                        <input value="<?= set_value('dep'); ?>" name="dep" id="dep" type="text" class="form-control" placeholder="Nama Departement...">
                        <?= form_error('dep', '<small class="text-danger">', '</small>'); ?>
                    </div>
                </div>
                
                <div class="row form-group">
                    <div class="col-md-9 offset-md-3">
                        <button type="submit" class="btn btn-primary">Simpan</button>
                        <button type="reset" class="btn btn-secondary">Reset</bu>
                    </div>
                </div>
                <?= form_close(); ?>
            </div>
        </div>
    </div>
</div>