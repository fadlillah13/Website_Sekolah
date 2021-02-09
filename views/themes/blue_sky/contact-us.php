<script async defer src="https://maps.googleapis.com/maps/api/js?key=<?=$api_key?>&callback=initMap"></script>
<style>
#map {
	width: 100%;
	height: 400px;
	background-color: grey;
	margin-bottom: 15px;
}
</style>
<script>
var latitude = <?=$latitude?>;
var longitude = <?=$longitude?>;
function initMap() {
	var coordinate = {lat: latitude, lng: longitude};
	var map = new google.maps.Map(document.getElementById('map'), {
		zoom: 15,
		center: coordinate,
		mapTypeId: 'roadmap'
	});
	var marker = new google.maps.Marker({
		position: coordinate,
		map: map
	});
}
</script>
<div class="col-lg-8 col-md-8 col-sm-12 ">
	<h5 class="page-title mb-3"><?=$page_title?></h5>
	<div id="map" class="w-100 border border-secondary"></div>
	<div class="card rounded-0 border border-secondary mb-3">
		<div class="card-body">
			<div class="form-group row mb-2">
				<label for="comment_author" class="col-sm-3 control-label">Nama Lengkap <span style="color: red">*</span></label>
				<div class="col-sm-9">
					<input type="text" class="form-control form-control-sm rounded-0 border border-secondary" id="comment_author" name="comment_author">
				</div>
			</div>
			<div class="form-group row mb-2">
				<label for="comment_email" class="col-sm-3 control-label">Email <span style="color: red">*</span></label>
				<div class="col-sm-9">
					<input type="text" class="form-control form-control-sm rounded-0 border border-secondary" id="comment_email" name="comment_email">
				</div>
			</div>
			<div class="form-group row mb-2">
				<label for="comment_url" class="col-sm-3 control-label">URL</label>
				<div class="col-sm-9">
					<input type="text" class="form-control form-control-sm rounded-0 border border-secondary" id="comment_url" name="comment_url">
				</div>
			</div>
			<div class="form-group row mb-2">
				<label for="comment_content" class="col-sm-3 control-label">Pesan <span style="color: red">*</span></label>
				<div class="col-sm-9">
					<textarea name="name" class="form-control form-control-sm rounded-0 border border-secondary" id="comment_content" rows="4"></textarea>
				</div>
			</div>
			<?php if (NULL !== __session('recaptcha_status') && __session('recaptcha_status') == 'enable') { ?>
				<div class="form-group row mb-2">
					<label class="col-sm-3 control-label"></label>
					<div class="col-sm-9">
						<div class="g-recaptcha" data-sitekey="<?=$recaptcha_site_key?>"></div>
					</div>
				</div>
			<?php } ?>
		</div>
		<div class="card-footer">
			<div class="form-group row mb-0">
				<div class="offset-sm-3 col-sm-9">
					<button type="button" onclick="send_message(); return false;" class="btn action-button rounded-0"><i class="fa fa-send"></i> Submit</button>
				</div>
			</div>
		</div>
	</div>
</div>
<?php $this->load->view('themes/blue_sky/sidebar')?>
