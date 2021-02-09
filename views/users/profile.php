<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<script type="text/javascript">
// Save Changes
function save_changes() {
	var values = {
		user_full_name: $('#user_full_name').val(),
		user_email: $('#user_email').val(),
		user_url: $('#user_url').val(),
		user_biography: $('#user_biography').val()
	};
	_H.Loading( true );
	$.post(_BASE_URL + 'profile/save', values, function( response ) {
		_H.Loading( false );
		var res = _H.StrToObject( response );
		_H.Notify(res.status, _H.Message(res.message));
	});
}
</script>
<section class="content">
	<div class="panel panel-primary">
		<div class="panel-heading"><i class="fa fa-sign-out"></i> UBAH PROFIL</div>
		<div class="panel-body">
			<form class="form-horizontal">
				<div class="box-body">
					<div class="form-group has-error">
						<label for="user_name" class="col-sm-3 control-label">Nama Pengguna</label>
						<div class="col-sm-9">
							<input type="text" disabled="disabled" class="form-control" id="user_name" value="<?=$query->user_name ? $query->user_name : '';?>">
							<span class="help-block">Nama pengguna tidak dapat diubah</span>
						</div>
					</div>
					<div class="form-group">
						<label for="user_full_name" class="col-sm-3 control-label">Nama Lengkap</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="user_full_name" value="<?=$query->user_full_name ? $query->user_full_name : '';?>">
						</div>
					</div>
					<div class="form-group">
						<label for="user_email" class="col-sm-3 control-label">Email</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="user_email" value="<?=$query->user_email ? $query->user_email : '';?>">
						</div>
					</div>
					<div class="form-group">
						<label for="user_url" class="col-sm-3 control-label">URL</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="user_url" value="<?=$query->user_url ? $query->user_url : '';?>">
						</div>
					</div>
					<div class="form-group">
						<label for="user_biography" class="col-sm-3 control-label">Biografi</label>
						<div class="col-sm-9">
							<textarea rows="5" class="form-control" id="user_biography"><?=$query->user_biography ? $query->user_biography : '';?></textarea>
						</div>
					</div>
					<div class="form-group">
                  <div class="col-sm-offset-3 col-sm-9">
                     <button type="submit" onclick="save_changes(); return false;" class="btn btn-primary submit"><i class="fa fa-save"></i> SIMPAN PERUBAHAN</button>
                  </div>
               </div>
				</div>
			</form>
		</div>
	</div>
</section>
