<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * CMS Sekolahku | CMS (Content Management System) dan PPDB/PMB Online GRATIS
 * untuk sekolah SD/Sederajat, SMP/Sederajat, SMA/Sederajat, dan Perguruan Tinggi
 * @version    2.4.4
 * @author     Anton Sofyan | https://facebook.com/antonsofyan | 4ntonsofyan@gmail.com | 0857 5988 8922
 * @copyright  (c) 2014-2019
 * @link       https://sekolahku.web.id
 *
* PERINGATAN :
 * 1. TIDAK DIPERKENANKAN MENGGUNAKAN CMS INI TANPA SEIZIN DARI PIHAK PENGEMBANG APLIKASI.
 * 2. TIDAK DIPERKENANKAN MEMPERJUALBELIKAN APLIKASI INI TANPA SEIZIN DARI PIHAK PENGEMBANG APLIKASI.
 * 3. TIDAK DIPERKENANKAN MENGHAPUS KODE SUMBER APLIKASI.
 */

class Migrate_v1_to_v2premium extends Public_Controller {

	private $DB1;
	private $DB2;

	/**
	 * Class Constructor
	 *
	 * @return Void
	 */
	public function __construct() {
		parent::__construct();
		if (__session('user_type') !== 'super_user')
      	redirect(base_url());
		$this->DB1 = $this->load->database('db1', TRUE); // Old Database
		$this->DB2 = $this->load->database('default', TRUE); // Current Database
	}

	/**
	 * @access  public
	 */
	public function index() {
		$this->albums();
		$this->photos();
		$this->file_categories();
		$this->files();
		$this->post_categories();
		$this->posts();
		$this->pages();
		$this->majors();
		$this->admission_types();
		$this->prospective_students();
		$this->class_groups();
		$this->contact_us();
		$this->quotes();
		$this->settings();
		$this->opening_speech();
	}

	/**
	 * Migrate Albums
	 * SOURCE TABLE 	: album (album_id, album)
	 * TARGET TABLE 	: albums (id, album_title, album_description)
	 * @access  public
	 */
	private function albums() {
		$this->DB2->truncate('albums');
		$query = $this->DB1->query("SELECT * FROM album");
		foreach($query->result() as $row) {
			$data = [
				'id' => $row->album_id,
				'album_title' => $row->album,
				'album_description' => $row->album
			];
			$this->DB2->insert('albums', $data);
		}
	}

	/**
	 * Migrate Photos
	 * SOURCE TABLE 	: photo (photo_id, photo_title, photo_thumb, photo_original, album_id)
	 * TARGET TABLE 	: photos (id, photo_album_id, photo_name)
	 * @access  public
	 */
	private function photos() {
		$this->DB2->truncate('photos');
		$query = $this->DB1->query("SELECT * FROM photo");
		foreach($query->result() as $row) {
			$data = [
				'id' => $row->photo_id,
				'photo_album_id' => $row->album_id,
				'photo_name' => $row->photo_thumb
			];
			$this->DB2->insert('photos', $data);
		}
	}

	/**
	 * Migrate File Categories
	 * SOURCE TABLE 	: file_category (category_id, category, parent)
	 * TARGET TABLE 	: categories (id, category_name, category_slug, category_description, category_type)
	 * @access  public
	 */	
	private function file_categories() {
		$this->DB2->truncate('categories');
		$query = $this->DB1->query("SELECT * FROM file_category");
		foreach($query->result() as $row) {
			$data = [
				'id' => $row->category_id,
				'category_name' => $row->category,
				'category_slug' => slugify($row->category),
				'category_type' => 'file',
				'category_description' => $row->category
			];
			$this->DB2->insert('categories', $data);
		}
	}

	/**
	 * Migrate Files
	 * SOURCE TABLE 	: file (id, category_id, title, description, type, size, file, counter, access)
	 * TARGET TABLE 	: files (id, file_title, file_description, file_name, file_type, file_category_id, file_path, file_ext, file_size, file_visibility, file_counter)
	 * @access  public
	 */	
	private function files() {
		$this->DB2->truncate('files');
		$query = $this->DB1->query("SELECT * FROM file");
		foreach($query->result() as $row) {
			$data = [
				'id' => $row->id,
				'file_category_id' => $row->category_id,
				'file_title' => $row->title,
				'file_description' => $row->description,
				'file_name' => $row->file,
				'file_type' => $row->type,
				'file_size' => $row->size,
				'file_counter' => $row->counter
			];
			$this->DB2->insert('files', $data);
		}
	}

	/**
	 * Migrate Post Categories
	 * SOURCE TABLE 	: category (category_id, category)
	 * TARGET TABLE 	: categories (id, category_name, category_slug, category_description, category_type)
	 * @access  public
	 */	
	private function post_categories() {
		$query = $this->DB1->query("SELECT * FROM category");
		foreach($query->result() as $row) {
			$data = [
				'category_name' => $row->category,
				'category_slug' => slugify($row->category),
				'category_type' => 'post',
				'category_description' => $row->category
			];
			$this->DB2->insert('categories', $data);
		}

		$data = [
			'category_name' => 'Pengumuman',
			'category_slug' => slugify('Pengumuman'),
			'category_type' => 'post',
			'category_description' => 'Pengumuman'
		];
		$this->DB2->insert('categories', $data);

		$data = [
			'category_name' => 'Agenda',
			'category_slug' => slugify('Agenda'),
			'category_type' => 'post',
			'category_description' => 'Agenda'
		];
		$this->DB2->insert('categories', $data);
	}

	/**
	 * Migrate Post Categories
	 * SOURCE TABLE : posts
	 	- post_id
	 	- post_title
	 	- post_date
	 	- post_type
	 	- post_content
	 	- user_id
	 	- post_parent
	 	- category_id
	 	- post_image
	 	- order_pages
	 	- slug
	 	- counter
	 * TARGET TABLE 	: posts
		-	id
		-	post_title
		-	post_content
		-	post_image
		-	post_author
		-	post_categories
		-	post_type
		-	post_status
		-	post_visibility
		-	post_comment_status
		-	post_slug
		-	post_tags
		-	post_counter
	 * @access  public
	 */	
	private function posts() {
		$this->DB2->truncate('posts');

		$categories = $this->DB2->query("
			SELECT id
				, category_name 
			FROM categories 
			WHERE category_type = 'post'
		");
		$category_id = [];
		foreach($categories->result() as $row) {
			$category_id[trim(strtolower($row->category_name))] = $row->id;
		}

		$query = $this->DB1->query("
			SELECT x1.* 
				, COALESCE(x2.category, x1.post_type) AS category
			FROM posts x1 
			LEFT JOIN category x2
				ON x1.category_id = x2.category_id
			WHERE x1.post_type IN ('post', 'agenda', 'pengumuman')
		");
		foreach($query->result() as $row) {
			$data = [
				'id' => $row->post_id,
				'post_title' => $row->post_title,
				'post_content' => $row->post_content,
				'post_image' => $row->post_image,
				'post_author' => $row->user_id,
				'post_categories' => $category_id[trim(strtolower($row->category))],
				'post_type' => 'post',
				'post_status' => 'publish',
				'post_visibility' => 'public',
				'post_comment_status' => 'open',
				'post_slug' => slugify($row->post_title),
				'post_counter' => $row->counter,
				'created_at' => $row->post_date
			];
			$this->DB2->insert('posts', $data);
		}
	}

	private function pages() {
		$query = $this->DB1->query("SELECT * FROM posts WHERE post_type = 'page'");
		foreach($query->result() as $row) {
			$data = [
				'id' => $row->post_id,
				'post_title' => $row->post_title,
				'post_content' => $row->post_content,
				'post_image' => $row->post_image,
				'post_author' => $row->user_id,
				'post_type' => 'page',
				'post_status' => 'publish',
				'post_visibility' => 'public',
				'post_comment_status' => 'open',
				'post_slug' => slugify($row->post_title),
				'post_counter' => $row->counter,
				'created_at' => $row->post_date
			];
			$this->DB2->insert('posts', $data);
		}
	}

	/**
	 * Migrate Jurusan
	 * SOURCE TABLE 	: jurusan (jurusan_id, jurusan, nama_singkat)
	 * TARGET TABLE 	: majors (id, major_name, major_short_name)
	 * @access  public
	 */	
	private function majors() {
		$this->DB2->truncate('majors');
		$query = $this->DB1->query("SELECT * FROM jurusan");
		foreach($query->result() as $row) {
			$data = [
				'id' => $row->jurusan_id,
				'major_name' => $row->jurusan,
				'major_short_name' => $row->nama_singkat
			];
			$this->DB2->insert('majors', $data);
		}
	}

	/**
	 * Migrate Jalur Pendaftaran
	 * SOURCE TABLE 	: jalur_pendaftaran (jalur_pendaftaran_id, jalur_pendaftaran)
	 * TARGET TABLE 	: admission_types (id, admission_type)
	 * @access  public
	 */	
	private function admission_types() {
		$this->DB2->truncate('admission_types');
		$query = $this->DB1->query("SELECT * FROM jalur_pendaftaran");
		foreach($query->result() as $row) {
			$data = [
				'id' => $row->jalur_pendaftaran_id,
				'admission_type' => $row->jalur_pendaftaran
			];
			$this->DB2->insert('admission_types', $data);
		}
	}

	/**
	 * Migrate Peserta Didik Baru
	 * SOURCE TABLE 	: siswa
	 	-	id
		-	no_daftar
		-	nis
		-	nisn
		-	nama
		-	kelas_id
		-	status_siswa
		-	tempat_lahir
		-	tanggal_lahir
		-	jenis_kelamin
		-	agama
		-	status_anak
		-	anak_ke
		-	alamat
		-	telp_rumah
		-	email
		-	sekolah_asal
		-	diterima_dikelas
		-	pada_tanggal
		-	ayah
		-	ibu
		-	alamat_ortu
		-	telp_ortu
		-	pekerjaan_ayah
		-	pekerjaan_ibu
		-	nama_wali
		-	alamat_wali
		-	telp_wali
		-	pekerjaan_wali
		-	photo
		-	jalur_pendaftaran_id
		-	tanggal_daftar
		-	pilihan_1
		-	pilihan_2
		-	hasil_seleksi
		-	tahun_lulus
		-	pin_bb
		-	facebook
		-	aktivitas_sekarang
		-	twitter

	 * TARGET TABLE 	: students
		-	id
		-	major_id
		-	first_choice_id
		-	second_choice_id
		-	registration_number
		-	admission_exam_number
		-	selection_result
		-	admission_phase_id
		-	admission_type_id
		-	photo
		-	achievement
		-	is_student
		-	is_prospective_student
		-	is_alumni
		-	is_transfer
		-	re_registration
		-	start_date
		-	nim
		-	nis
		-	nisn
		-	nik
		-	prev_exam_number
		-	prev_diploma_number
		-	paud
		-	tk
		-	skhun
		-	prev_school_name
		-	prev_school_address
		-	hobby
		-	ambition
		-	full_name
		-	gender
		-	birth_place
		-	birth_date
		-	religion_id
		-	special_need_id
		-	street_address
		-	rt
		-	rw
		-	sub_village
		-	village
		-	sub_district
		-	district
		-	postal_code
		-	residence_id
		-	transportation_id
		-	phone
		-	mobile_phone
		-	email
		-	sktm
		-	kks
		-	kps
		-	kip
		-	kis
		-	citizenship
		-	country
		-	father_name
		-	father_birth_year
		-	father_education_id
		-	father_employment_id
		-	father_monthly_income_id
		-	father_special_need_id
		-	mother_name
		-	mother_birth_year
		-	mother_education_id
		-	mother_employment_id
		-	mother_monthly_income_id
		-	mother_special_need_id
		-	guardian_name
		-	guardian_birth_year
		-	guardian_education_id
		-	guardian_employment_id
		-	guardian_monthly_income_id
		-	mileage
		-	traveling_time
		-	height
		-	weight
		-	sibling_number
		-	student_status_id
		-	end_date
		-	reason
	 * @access  public
	 */	
	private function prospective_students() {
		$this->DB2->truncate('students');
		$query = $this->DB1->query("SELECT * FROM siswa");
		foreach($query->result() as $row) {
			$data = [
				'id' => $row->id,
				'first_choice_id' => $row->pilihan_1,
				'second_choice_id' => $row->pilihan_2,
				'registration_number' => str_replace('2017', '20170', $row->no_daftar),
				'selection_result' => $row->hasil_seleksi == 'tidak_diterima' ? 'unapproved' : ($row->hasil_seleksi == 'diterima' ? 'approved' : $row->hasil_seleksi),
				'admission_type_id' => $row->jalur_pendaftaran_id,
				'photo' => $row->photo,
				'is_student' => 'false',
				'is_prospective_student' => 'true',
				'is_alumni' => 'false',
				'is_transfer' => 'false',
				're_registration' => 'false',
				'prev_school_name' => $row->sekolah_asal,
				'full_name' => $row->nama,
				'gender' => $row->jenis_kelamin == 'Laki-Laki' ? 'M' : 'F',
				'birth_place' => $row->tempat_lahir,
				'birth_date' => $row->tanggal_lahir,
				'religion_id' => 89, // Islam
				'street_address' => $row->alamat,
				'phone' => $row->telp_rumah,
				'email' => $row->email,
				'father_name' => $row->ayah,
				'mother_name' => $row->ibu,
				'guardian_name' => $row->nama_wali,
				'created_at' => $row->tanggal_daftar
			];
			$this->DB2->insert('students', $data);
		}
	}

	/**
	 * Migrate class_groups
	 * SOURCE TABLE 	: kelas (kelas_id, kelas, sub_kelas, jurusan_id)
	 * TARGET TABLE 	: class_groups (id, class_group, sub_class_group, major_id)
	 * @access  public
	 */	
	private function class_groups() {
		$this->DB2->truncate('class_groups');
		$query = $this->DB1->query("SELECT * FROM kelas");
		foreach($query->result() as $row) {
			$data = [
				'id' => $row->kelas_id,
				'class_group' => $row->kelas,
				'sub_class_group' => $row->sub_kelas,
				'major_id' => $row->jurusan_id
			];
			$this->DB2->insert('class_groups', $data);
		}
	}

	/**
	 * Migrate Contact Us
	 * SOURCE TABLE 	: hubungi_kami
		-	id
		-	nama
		-	email
		-	url
		-	pertanyaan
		-	jawaban
		-	tanggal
		-	ip_address
		-	access

	 * TARGET TABLE 	: comments
		-	id
		-	comment_post_id
		-	comment_author
		-	comment_email
		-	comment_url
		-	comment_ip_address
		-	comment_content
		-	comment_status
		-	comment_agent
		-	comment_parent_id
		-	comment_type
	 * @access  public
	 */
	private function contact_us() {
		$this->DB2->truncate('comments');
		$query = $this->DB1->query("SELECT * FROM hubungi_kami");
		foreach($query->result() as $row) {
			$data = [
				'id' => $row->id,
				'comment_author' => $row->nama,
				'comment_email' => $row->email,
				'comment_url' => $row->url,
				'comment_ip_address' => $row->ip_address,
				'comment_content' => $row->pertanyaan,
				'comment_type' => 'message',
				'created_at' => $row->tanggal
			];
			$this->DB2->insert('comments', $data);
		}
	}

	/**
	 * Migrate Quotes
	 * SOURCE TABLE 	: kata_motivasi (id, content, author)
	 * TARGET TABLE 	: quotes (id, quote, quote_by)
	 * @access  public
	 */
	private function quotes() {
		$this->DB2->truncate('quotes');
		$query = $this->DB1->query("SELECT * FROM kata_motivasi");
		foreach($query->result() as $row) {
			$data = [
				'id' => $row->id,
				'quote' => $row->content,
				'quote_by' => $row->author
			];
			$this->DB2->insert('quotes', $data);
		}
	}

	/**
	 * Migrate Settings
	 * SOURCE TABLE 	: options (id, variable, value)
	 * TARGET TABLE 	: settings 
	 	-	id
	 	- setting_group
	 	- setting_variable
	 	- setting_value
	 	- setting_default_value
	 	- setting_access_group, setting_description
	 * @access  public
	 */
	private function settings() {
		$query = $this->DB1->query("SELECT * FROM options");
		$options = [];
		foreach($query->result() as $row) {
			$options[$row->variable] = $row->value;
		}

		$settings = $this->DB2->query("SELECT * FROM settings");
		foreach ($settings->result() as $row) {
			if ($row->setting_variable == 'npsn') {
				$this->DB2->where('id', $row->id)->update('settings', ['setting_value' => $options['npsn']]);
			}

			if ($row->setting_variable == 'school_name') {
				$this->DB2->where('id', $row->id)->update('settings', ['setting_value' => $options['nama_sekolah']]);
			}

			if ($row->setting_variable == 'email') {
				$this->DB2->where('id', $row->id)->update('settings', ['setting_value' => $options['email']]);
			}

			if ($row->setting_variable == 'street_address') {
				$this->DB2->where('id', $row->id)->update('settings', ['setting_value' => $options['alamat']]);
			}

			if ($row->setting_variable == 'phone') {
				$this->DB2->where('id', $row->id)->update('settings', ['setting_value' => $options['telp']]);
			}

			if ($row->setting_variable == 'website') {
				$this->DB2->where('id', $row->id)->update('settings', ['setting_value' => $options['website']]);
			}

			if ($row->setting_variable == 'district') {
				$this->DB2->where('id', $row->id)->update('settings', ['setting_value' => $options['kabupaten']]);
			}

			if ($row->setting_variable == 'sub_district') {
				$this->DB2->where('id', $row->id)->update('settings', ['setting_value' => $options['kecamatan']]);
			}

			if ($row->setting_variable == 'village') {
				$this->DB2->where('id', $row->id)->update('settings', ['setting_value' => $options['kelurahan']]);
			}

			if ($row->setting_variable == 'latitude') {
				$this->DB2->where('id', $row->id)->update('settings', ['setting_value' => (explode(', ', $options['google_map'])[ 0 ])]);
			}

			if ($row->setting_variable == 'longitude') {
				$this->DB2->where('id', $row->id)->update('settings', ['setting_value' => (explode(', ', $options['google_map'])[ 1 ])]);
			}

			if ($row->setting_variable == 'meta_keywords') {
				$this->DB2->where('id', $row->id)->update('settings', ['setting_value' => $options['meta_keywords']]);
			}

			if ($row->setting_variable == 'meta_description') {
				$this->DB2->where('id', $row->id)->update('settings', ['setting_value' => $options['meta_description']]);
			}
		}
	}

	private function opening_speech() {
		$this->DB2
			->where('post_type', 'opening_speech')
			->delete('posts');
		$query = $this->DB1->query("SELECT * FROM options WHERE `variable`='sambutan_kepala_sekolah' LIMIT 1")->row();
		$data = [
			'post_title' => 'Sambutan Kepala Sekolah',
			'post_content' => $query->value,
			'post_type' => 'opening_speech',
		];
		$this->db->insert('posts', $data);
	}
}


				


