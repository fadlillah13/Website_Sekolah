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

class Admission_form extends Public_Controller {

	/**
	 * Constructor
	 * @access  public
	 */
	public function __construct() {
		parent::__construct();
		// If close, redirect
		if (__session('admission_status') == 'close') {
			redirect(base_url());
		}
		// If not in array, redirect
		$admission_start_date = __session('admission_start_date');
		$admission_end_date = __session('admission_end_date');
		if (NULL !== $admission_start_date && NULL !== $admission_end_date) {
			$date_range = array_date($admission_start_date, $admission_end_date);
			if ( ! in_array(date('Y-m-d'), $date_range)) {
				redirect(base_url());
			}
		}
		$this->load->model('m_registrants');
		$this->pk = M_registrants::$pk;
		$this->table = M_registrants::$table;
	}

	/**
	 * Index
	 * @return Void
	 */
	public function index() {
		$this->load->helper('form');
		$this->load->model(['m_majors', 'm_settings']);
		$this->vars['recaptcha_site_key'] = __session('recaptcha_site_key');
		$this->vars['page_title'] = 'Formulir Penerimaan '. (__session('school_level') >= 5 ? 'Mahasiswa' : 'Peserta Didik').' Baru Tahun '.__session('admission_year');
		$this->vars['religions'] = ['' => 'Pilih :'] + get_options('religions', FALSE);
		$this->vars['special_needs'] = get_options('special_needs', FALSE);
		$this->vars['residences'] = ['' => 'Pilih :'] + get_options('residences', FALSE);
		$this->vars['transportations'] = ['' => 'Pilih :'] + get_options('transportations', FALSE);
		$this->vars['educations'] = ['' => 'Pilih :'] + get_options('educations', FALSE);
		$this->vars['employments'] = ['' => 'Pilih :'] + get_options('employments', FALSE);
		$this->vars['monthly_incomes'] = ['' => 'Pilih :'] + get_options('monthly_incomes', FALSE);
		$this->vars['admission_types'] = ['' => 'Pilih :'] + get_options('admission_types', FALSE);
		$this->vars['majors'] = ['' => 'Pilih :'] + $this->m_majors->dropdown();
		$this->vars['content'] = 'themes/'.theme_folder().'/admission-form';
		$this->load->view('themes/'.theme_folder().'/index', $this->vars);
	}

	/**
	  * Save
	  */
	public function save() {
		if ($this->input->is_ajax_request()) {
			if (NULL !== __session('recaptcha_status') && __session('recaptcha_status') == 'enable') {
				$this->load->library('recaptcha');
				$recaptcha = $this->input->post('recaptcha');
				$recaptcha_verified = $this->recaptcha->verifyResponse($recaptcha);
				if ( ! $recaptcha_verified['success'] ) {
					$this->vars['status'] = 'recaptcha_error';
					$this->vars['message'] = 'Recaptcha Error!';
					$this->output
						->set_content_type('application/json', 'utf-8')
						->set_output(json_encode($this->vars, JSON_HEX_APOS | JSON_HEX_QUOT))
						->_display();
					exit;
				}
			}

			if ($this->validation()) {
				$fill_data = $this->fill_data();
				// Upload File
				$has_uploaded = false;
				if ( ! empty($_FILES['photo']['name']) ) {
					$photo = $this->upload_file();
					if ($photo['status'] == 'success') {
						$has_uploaded = true;
						$fill_data['photo'] = $photo['file_name'];
					} else {
						$this->vars['status'] = $photo['status'];
						$this->vars['message'] = $photo['message'];
						$this->output
							->set_content_type('application/json', 'utf-8')
							->set_output(json_encode($this->vars, JSON_HEX_APOS | JSON_HEX_QUOT))
							->_display();
						exit;
					}
				}

				$query = $this->model->insert($this->table, $fill_data);
				if ( $query ) {
					$result = $this->m_registrants->find_registrant($fill_data['birth_date'], $fill_data['registration_number']);
					$this->load->library('admission');
					$this->admission->create_pdf($result);
				}
				if (!isset($this->vars['status'])) {
					$this->vars['status'] = $query ? 'success' : 'error';
				}
				if (!isset($this->vars['message'])) {
					$this->vars['message'] = $query ? 'created' : 'not_created';
				}
				$file_name = 'formulir-penerimaan-'. (__session('school_level') >= 5 ? 'mahasiswa' : 'peserta-didik').'-baru-tahun-'.__session('admission_year');
				$file_name .= '-'.$fill_data['birth_date'].'-'.$fill_data['registration_number'].'.pdf';
				$this->vars['file_name'] = $file_name;
				if ( ! $query && $has_uploaded ) @unlink(FCPATH.'media_library/students/'.$upload['file_name']);
			} else {
				$this->vars['status'] = 'error';
				$this->vars['message'] = validation_errors();
			}
			$this->output
				->set_content_type('application/json', 'utf-8')
				->set_output(json_encode($this->vars, JSON_HEX_APOS | JSON_HEX_QUOT))
				->_display();
			exit;
		}
	}

	/**
	  * Upload File
	  * @return Array
	  */
	private function upload_file() {
		$config['upload_path'] = './media_library/students/';
		$config['allowed_types'] = 'jpg|jpeg';
		$config['max_size'] = 1024; // 1 Mb
		$config['encrypt_name'] = true;
		$this->load->library('upload', $config);
		if ( ! $this->upload->do_upload('photo') ) {
			$this->vars['status'] = 'error';
			$this->vars['message'] = $this->upload->display_errors();
			$this->vars['file_name'] = '';
		} else {
			$file = $this->upload->data();
			// chmood file
			@chmod(FCPATH.'media_library/students/'.$file['file_name'], 0777);
			$this->image_resize(FCPATH.'media_library/students/', $file['file_name']);
			$this->vars['status'] = 'success';
			$this->vars['message'] = 'uploaded';
			$this->vars['file_name'] = $file['file_name'];
		}
		return $this->vars;
	}

	/**
	 * Image Resize
	 * @param String $source
	 * @param String $file_name
	 * @return Void
	 */
	private function image_resize($source, $file_name) {
		$this->load->library('image_lib');
		$config['image_library'] = 'gd2';
		$config['source_image'] = $source .'/'.$file_name;
		$config['maintain_ratio'] = true;
		$config['width'] = (int) __session('student_photo_width');
		// $config['height'] = (int) __session('student_photo_height');
		$this->image_lib->initialize($config);
		$this->image_lib->resize();
		@chmod($source.'/'.$file_name, 0644);
	}

	/**
	 * Fill Data
	 * @return Array
	 */
	private function fill_data() {
		$data = [];
		// Wajib diisi :
		$data['created_at'] = date('Y-m-d H:i:s');
		$data['registration_number'] = $this->m_registrants->registration_number();
		$data['is_prospective_student'] = 'true';
		$data['is_alumni'] = 'false';
		$data['is_student'] = 'false';
		$data['re_registration'] = 'false';

		$data['is_transfer'] = $this->input->post('is_transfer', true);
		$data['admission_type_id'] = (int) $this->input->post('admission_type_id', true);
		$data['admission_phase_id'] = NULL !== __session('admission_phase_id') ? __session('admission_phase_id') : 0;
		$data['full_name'] = $this->input->post('full_name', true);
		$data['birth_date'] = $this->input->post('birth_date', true);
		$data['gender'] = $this->input->post('gender', true);
		$data['district'] = $this->input->post('district', true);
		$data['first_choice_id'] = $this->input->post('first_choice_id', true) ? (int) $this->input->post('first_choice_id', true) : 0;
		$data['second_choice_id'] = $this->input->post('second_choice_id', true) ? (int) $this->input->post('second_choice_id', true) : 0;
		$data['nisn'] = $this->input->post('nisn', true) ? $this->input->post('nisn', true) : NULL;
		$data['nik'] = $this->input->post('nik', true) ? $this->input->post('nik', true) : NULL;
		$data['prev_exam_number'] = $this->input->post('prev_exam_number', true) ? $this->input->post('prev_exam_number', true) : NULL;
		$data['achievement'] = $this->input->post('achievement', true) ? $this->input->post('achievement', true) : NULL;
		$data['paud'] = $this->input->post('paud', true) ? $this->input->post('paud', true) : NULL;
		$data['tk'] = $this->input->post('tk', true) ? $this->input->post('tk', true) : NULL;
		$data['skhun'] = $this->input->post('skhun', true) ? $this->input->post('skhun', true) : NULL;
		$data['prev_school_name'] = $this->input->post('prev_school_name', true) ? $this->input->post('prev_school_name', true) : NULL;
		$data['prev_school_address'] = $this->input->post('prev_school_address', true) ? $this->input->post('prev_school_address', true) : NULL;
		$data['prev_diploma_number'] = $this->input->post('prev_diploma_number', true) ? $this->input->post('prev_diploma_number', true) : NULL;
		$data['hobby'] = $this->input->post('hobby', true) ? $this->input->post('hobby', true) : NULL;
		$data['ambition'] = $this->input->post('ambition', true) ? $this->input->post('ambition', true) : NULL;
		$data['birth_place'] = $this->input->post('birth_place', true) ? $this->input->post('birth_place', true) : NULL;
		$data['religion_id'] = $this->input->post('religion_id', true) ? (int) $this->input->post('religion_id', true) : 0;
		$data['special_need_id'] = $this->input->post('special_need_id', true) ? (int) $this->input->post('special_need_id', true) : 0;
		$data['street_address'] = $this->input->post('street_address', true) ? $this->input->post('street_address', true) : NULL;
		$data['rt'] = $this->input->post('rt', true) ? $this->input->post('rt', true) : NULL;
		$data['rw'] = $this->input->post('rw', true) ? $this->input->post('rw', true) : NULL;
		$data['sub_village'] = $this->input->post('sub_village', true) ? $this->input->post('sub_village', true) : NULL;
		$data['village'] = $this->input->post('village', true) ? $this->input->post('village', true) : NULL;
		$data['sub_district'] = $this->input->post('sub_district', true) ? $this->input->post('sub_district', true) : NULL;
		$data['postal_code'] = $this->input->post('postal_code', true) ? $this->input->post('postal_code', true) : NULL;
		$data['residence_id'] = $this->input->post('residence_id', true) ? $this->input->post('residence_id', true) : NULL;
		$data['transportation_id'] = $this->input->post('transportation_id', true) ? $this->input->post('transportation_id', true) : NULL;
		$data['phone'] = $this->input->post('phone', true) ? $this->input->post('phone', true) : NULL;
		$data['mobile_phone'] = $this->input->post('mobile_phone', true) ? $this->input->post('mobile_phone', true) : NULL;
		$data['email'] = $this->input->post('email', true) ? $this->input->post('email', true) : NULL;
		$data['sktm'] = $this->input->post('sktm', true) ? $this->input->post('sktm', true) : NULL;
		$data['kks'] = $this->input->post('kks', true) ? $this->input->post('kks', true) : NULL;
		$data['kps'] = $this->input->post('kps', true) ? $this->input->post('kps', true) : NULL;
		$data['kip'] = $this->input->post('kip', true) ? $this->input->post('kip', true) : NULL;
		$data['kis'] = $this->input->post('kis', true) ? $this->input->post('kis', true) : NULL;
		$data['citizenship'] = $this->input->post('citizenship', true) ? $this->input->post('citizenship', true) : 'WNI';
		$data['country'] = $this->input->post('country', true) ? $this->input->post('country', true) : NULL;
		$data['father_name'] = $this->input->post('father_name', true) ? $this->input->post('father_name', true) : NULL;
		$data['father_birth_year'] = $this->input->post('father_birth_year', true) ? $this->input->post('father_birth_year', true) : NULL;
		$data['father_education_id'] = $this->input->post('father_education_id', true) ? (int) $this->input->post('father_education_id', true) : 0;
		$data['father_employment_id'] = $this->input->post('father_employment_id', true) ? (int) $this->input->post('father_employment_id', true) : 0;
		$data['father_monthly_income_id'] = $this->input->post('father_monthly_income_id', true) ? (int) $this->input->post('father_monthly_income_id', true) : 0;
		$data['father_special_need_id'] = $this->input->post('father_special_need_id', true) ? (int) $this->input->post('father_special_need_id', true) : 0;
		$data['mother_name'] = $this->input->post('mother_name', true) ? $this->input->post('mother_name', true) : NULL;
		$data['mother_birth_year'] = $this->input->post('mother_birth_year', true) ? $this->input->post('mother_birth_year', true) : NULL;
		$data['mother_education_id'] = $this->input->post('mother_education_id', true) ? (int) $this->input->post('mother_education_id', true) : 0;
		$data['mother_employment_id'] = $this->input->post('mother_employment_id', true) ? (int) $this->input->post('mother_employment_id', true) : 0;
		$data['mother_monthly_income_id'] = $this->input->post('mother_monthly_income_id', true) ? (int) $this->input->post('mother_monthly_income_id', true) : 0;
		$data['mother_special_need_id'] = $this->input->post('mother_special_need_id', true) ? (int) $this->input->post('mother_special_need_id', true) : 0;
		$data['guardian_name'] = $this->input->post('guardian_name', true) ? $this->input->post('guardian_name', true) : NULL;
		$data['guardian_birth_year'] = $this->input->post('guardian_birth_year', true) ? $this->input->post('guardian_birth_year', true) : NULL;
		$data['guardian_education_id'] = $this->input->post('guardian_education_id', true) ? (int) $this->input->post('guardian_education_id', true) : 0;
		$data['guardian_employment_id'] = $this->input->post('guardian_employment_id', true) ? (int) $this->input->post('guardian_employment_id', true) : 0;
		$data['guardian_monthly_income_id'] = $this->input->post('guardian_monthly_income_id', true) ? (int) $this->input->post('guardian_monthly_income_id', true) : 0;
		$data['mileage'] = $this->input->post('mileage', true) ? $this->input->post('mileage', true) : NULL;
		$data['traveling_time'] = $this->input->post('traveling_time', true) ? $this->input->post('traveling_time', true) : NULL;
		$data['height'] = $this->input->post('height', true) ? $this->input->post('height', true) : NULL;
		$data['weight'] = $this->input->post('weight', true) ? $this->input->post('weight', true) : NULL;
		$data['sibling_number'] = $this->input->post('sibling_number', true) ? (int) $this->input->post('sibling_number', true) : 0;
		return $data;
	}

	/**
	 * Validation Form
	 * @return Boolean
	 */
	private function validation() {
		$this->load->library('form_validation');
		$val = $this->form_validation;
		$val->set_rules('is_transfer', 'Jenis Pendaftaran', 'trim|required|in_list[true,false]');
		if (__session('major_count') > 0) {
			$val->set_rules('first_choice_id', 'Pilihan I (Satu)', 'trim|required|numeric');
			$val->set_rules('second_choice_id', 'Pilihan II (Dua)', 'trim|required|numeric');
		}
		$val->set_rules('admission_type_id', 'Jalur Pendaftaran', 'trim|required|numeric');
		$val->set_rules('prev_exam_number', 'Nomor Peserta Ujian', 'trim');
		$val->set_rules('paud', 'PAUD', 'trim');
		$val->set_rules('tk', 'TK', 'trim');
		$val->set_rules('hobby', 'Hobi', 'trim');
		$val->set_rules('ambition', 'Cita-cita', 'trim');
		$val->set_rules('full_name', 'Nama Lengkap', 'trim|required');
		$val->set_rules('gender', 'Jenis Kelamin', 'trim|required');
		$val->set_rules('skhun', 'Nomor Seri SKHUN Sebelumnya', 'trim');
		$val->set_rules('prev_diploma_number', 'Nomor Seri Ijazah Sebelumnya', 'trim');
		$val->set_rules('nisn', 'NISN', 'trim');
		$val->set_rules('nik', 'NIK', 'trim');
		$val->set_rules('birth_place', 'Tempat Lahir', 'trim|required');
		$val->set_rules('birth_date', 'Tanggal Lahir', 'trim|required');
		$val->set_rules('religion_id', 'Agama', 'trim|required|numeric');
		$val->set_rules('special_need_id', 'Kebutuhan Khusus', 'trim|numeric');
		$val->set_rules('street_address', 'Alamat Jalan', 'trim|required');
		$val->set_rules('rt', 'RT', 'trim');
		$val->set_rules('rw', 'RW', 'trim');
		$val->set_rules('sub_village', 'Nama Dusun', 'trim');
		$val->set_rules('village', 'Nama Kelurahan / Desa', 'trim');
		$val->set_rules('sub_district', 'Kecamatan', 'trim');
		$val->set_rules('district', 'Kabupaten', 'trim|required');
		$val->set_rules('postal_code', 'Kode Pos', 'trim|numeric');
		$val->set_rules('residence_id', 'Tempat Tinggal', 'trim|numeric');
		$val->set_rules('transportation_id', 'Moda Transportasi', 'trim|numeric');
		$val->set_rules('phone', 'Nomor Telepon', 'trim');
		$val->set_rules('mobile_phone', 'Nomor HP', 'trim|required');
		$val->set_rules('email', 'E-mail Pribadi', 'trim|valid_email|callback_email_exists');
		$val->set_rules('sktm', 'No. Surat Keterangan Tidak Mampu (SKTM)', 'trim');
		$val->set_rules('kks', 'No. Kartu Keluarga Sejahtera (KKS)', 'trim');
		$val->set_rules('kps', 'No. Kartu Pra Sejahtera (KPS)', 'trim');
		$val->set_rules('kip', 'No. Kartu Indonesia Pintar (KIP)', 'trim');
		$val->set_rules('kis', 'No. Kartu Indonesia Sehat (KIS)', 'trim');
		$val->set_rules('citizenship', 'Kewarganegaraan', 'trim|required|in_list[WNI,WNA]');
		$val->set_rules('country', 'Nama Negara', 'trim');

		$val->set_rules('father_name', 'Nama Ayah Kandung', 'trim|required');
		$val->set_rules('father_birth_year', 'Tahun Lahir Ayah', 'trim|numeric|required|min_length[4]|max_length[4]');
		$val->set_rules('father_education_id', 'Pendidikan Ayah', 'trim|numeric');
		$val->set_rules('father_employment_id', 'Pekerjaan Ayah', 'trim|numeric');
		$val->set_rules('father_monthly_income_id', 'Penghasilan Bulanan Ayah', 'trim|numeric');
		$val->set_rules('father_special_need_id', 'Kebutuhan Khusus Ayah', 'trim|numeric');

		$val->set_rules('mother_name', 'Nama Ibu Kandung', 'trim|required');
		$val->set_rules('mother_birth_year', 'Tahun Lahir Ibu', 'trim|numeric|min_length[4]|max_length[4]');
		$val->set_rules('mother_education_id', 'Pendidikan Ibu', 'trim|numeric');
		$val->set_rules('mother_employment_id', 'Pekerjaan Ibu', 'trim|numeric');
		$val->set_rules('mother_monthly_income_id', 'Penghasilan Bulanan Ibu', 'trim|numeric');
		$val->set_rules('mother_special_need_id', 'Kebutuhan Khusus Ibu', 'trim|numeric');

		$val->set_rules('guardian_name', 'Nama Wali', 'trim');
		$val->set_rules('guardian_birth_year', 'Tahun Lahir Wali', 'trim|numeric|min_length[4]|max_length[4]');
		$val->set_rules('guardian_education_id', 'Pendidikan Wali', 'trim|numeric');
		$val->set_rules('guardian_employment_id', 'Pekerjaan Wali', 'trim|numeric');
		$val->set_rules('guardian_monthly_income_id', 'Penghasilan Bulanan Wali', 'trim|numeric');

		$val->set_rules('mileage', 'Jarak Tempat Tinggal ke Sekolah', 'trim|numeric|min_length[1]|max_length[5]');
		$val->set_rules('traveling_time', 'Waktu Tempuh ke Sekolah', 'trim|numeric|min_length[1]|max_length[5]');
		$val->set_rules('height', 'Tinggi Badan', 'trim|numeric|min_length[2]|max_length[5]');
		$val->set_rules('weight', 'Berat Badan', 'trim|numeric|min_length[2]|max_length[5]');
		$val->set_rules('sibling_number', 'Jumlah Saudara Kandung', 'trim|numeric|max_length[2]');

		$val->set_rules('declaration', 'Pernyataan', 'trim|required|in_list[true]|callback_declaration_check');

		$val->set_message('required', '{field} harus diisi');
		$val->set_message('min_length', '{field} Harus Diisi Minimal {param} Karakter');
		$val->set_message('max_length', '{field} harus Diisi Maksimal {param} Karakter');
		$val->set_message('numeric', '{field} harus diisi dengan angka');
		$val->set_error_delimiters('<div>&sdot; ', '</div>');
		return $val->run();
	}

	/**
    * Declaration Check
    * @return Boolean
    */
	public function declaration_check($str) {
		if ( ! filter_var((string) $str, FILTER_VALIDATE_BOOLEAN)) {
			$this->form_validation->set_message('declaration_check', 'Pernyataan Harus Diceklis');
			return false;
		}
		return true;
	}

	/**
	 * Email Exists ?
	 * @param String $email
	 * @return Boolean
	 */
	public function email_exists( $email ) {
		$this->load->model(['m_students', 'm_employees', 'm_users']);
		$student_exists = $this->m_students->email_exists( $email );
		$employee_exists = $this->m_employees->email_exists( $email );
		$user_exists = $this->m_users->email_exists( $email );
		if ( $student_exists || $employee_exists || $user_exists ) {
			$this->form_validation->set_message('email_exists', 'Email sudah digunakan');
			return FALSE;
		}
		return TRUE;
	}
}
