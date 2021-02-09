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

class Alumni extends Public_Controller {

	/**
	 * Class Constructor
	 *
	 * @return Void
	 */
	public function __construct() {
		parent::__construct();
	}

	/**
	 * Index
	 * @return Void
	 */
	public function index() {
		$this->load->helper('form');
		$this->vars['page_title'] = 'Pendaftaran Alumni';
		$this->vars['recaptcha_site_key'] = __session('recaptcha_site_key');
		$this->vars['content'] = 'themes/'.theme_folder().'/alumni-form';
		$this->load->view('themes/'.theme_folder().'/index', $this->vars);
	}

	/**
	 * save
	 * @return Object
	 */
	public function save() {
		if ($this->input->is_ajax_request()) {
			$recaptcha_status = __session('recaptcha_status');
			if (NULL !== $recaptcha_status && $recaptcha_status == 'enable') {
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
				// Photo Uploaded
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

				$query = $this->model->insert('students', $fill_data);
				$this->vars['status'] = $query ? 'success' : 'error';
				$this->vars['message'] = $query ? 'Data Anda berhasil disimpan.' : 'Terjadi kesalahan dalam menyimpan data';
				if ( ! $query && $has_uploaded ) @unlink(FCPATH.'media_library/students/'.$photo['file_name']);
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
	 * Fill Data
	 * @return Array
	 */
	private function fill_data() {
		return [
			'created_at' => date('Y-m-d H:i:s'),
			'created_by' => __session('user_id'),
			'is_alumni' => 'unverified',
			'full_name' => $this->input->post('full_name', true),
			'gender' => $this->input->post('gender', true),
			'birth_date' => $this->input->post('birth_date', true),
			'end_date' => $this->input->post('end_date', true).'-06-20',
			'identity_number' => $this->input->post('identity_number', true),
			'street_address' => $this->input->post('street_address', true),
			'email' => $this->input->post('email', true),
			'phone' => $this->input->post('phone', true),
			'mobile_phone' => $this->input->post('mobile_phone', true)
		];
	}

	/**
	 * Validation Form
	 * @return Boolean
	 */
	private function validation() {
		$this->load->library('form_validation');
		$val = $this->form_validation;
		$val->set_rules('full_name', 'Nama Lengkap', 'trim|required');
		$val->set_rules('gender', 'Jenis Kelamin', 'trim|required');
		$val->set_rules('birth_date', 'Tanggal Lahir', 'trim|required|callback_date_format_check');
		$val->set_rules('end_date', 'Tahun Lulus', 'trim|required|min_length[4]|max_length[4]|numeric');
		$val->set_rules('identity_number', __session('_identity_number'), 'trim|callback_identity_number_exists');
		$val->set_rules('street_address', 'ALamat Jalan', 'trim|required');
		$val->set_rules('email', 'Email', 'trim|required|valid_email|callback_email_exists');
		$val->set_rules('phone', 'Nomor Telepon', 'trim');
		$val->set_rules('mobile_phone', 'Nomor Handphone', 'trim');
		$val->set_message('required', '{field} harus diisi');
		$val->set_message('valid_email', '{field} harus diisi dengan format email yang benar');
		$val->set_error_delimiters('<div>&sdot; ', '</div>');
		return $val->run();
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
}
