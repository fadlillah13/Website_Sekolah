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

class Profile extends Admin_Controller {

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
		$id = (int) __session('user_id');
		$this->vars['title'] = 'Ubah Profil';
		$this->vars['user_profile'] = true;
		$this->vars['query'] = $this->model->RowObject('id', $id, 'users');
		$this->vars['content'] = 'users/profile';
		$this->load->view('backend/index', $this->vars);
	}

	/**
	* save
	* @return Object
	*/
	public function save() {
		if ($this->input->is_ajax_request()) {
			$id = (int) __session('user_id');
			if (_isNaturalNumber( $id )) {
				if ($this->validation( $id )) {
					$fill_data = $this->fill_data();
					$fill_data['updated_by'] = $id;
					$this->vars['status'] = $this->model->update($id, 'users', $fill_data) ? 'success' : 'error';
					$this->vars['message'] = $this->vars['status'] == 'success' ? 'updated' : 'not_updated';
				} else {
					$this->vars['status'] = 'error';
					$this->vars['message'] = validation_errors();
				}
			} else {
				$this->vars['status'] = 'error';
				$this->vars['message'] = 'not_updated';
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
			'user_full_name' => $this->input->post('user_full_name', true),
			'user_email' => $this->input->post('user_email', true),
			'user_url' => $this->input->post('user_url', true),
			'user_biography' => $this->input->post('user_biography', true)
		];
	}

	/**
	* Validation Form
	* @access  public
	* @return Boolean
	*/
	private function validation( $id = 0 ) {
		$this->load->library('form_validation');
		$val = $this->form_validation;
		$val->set_rules('user_full_name', 'Full Name', 'trim|required');
		$val->set_rules('user_email', 'Email', 'trim|required|valid_email|callback_email_exists[' . $id . ']');
		$val->set_rules('user_url', 'URL', 'trim|valid_url');
		$val->set_rules('user_biography', 'Biography', 'trim');
		$val->set_error_delimiters('<div>&sdot; ', '</div>');
		return $val->run();
	}

	/**
	 * Email Exists ?
	 * @param String $email
	 * @param Integer $user_id
	 * @return Boolean
	 */
	public function email_exists( $email, $user_id ) {
		$this->load->model(['m_students', 'm_employees', 'm_users']);
		$student_email_exists = $this->m_students->email_exists( $email );
		$employee_email_exists = $this->m_employees->email_exists( $email );
		$user_email_exists = $this->m_users->email_exists( $email, $user_id);
		if ( $student_email_exists || $employee_email_exists || $user_email_exists ) {
			$this->form_validation->set_message('email_exists', 'Email sudah digunakan');
			return FALSE;
		}
		return TRUE;
	}
}
