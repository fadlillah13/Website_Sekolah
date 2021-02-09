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

class Student_status extends Admin_Controller {

	/**
	 * Class Constructor
	 *
	 * @return Void
	 */
	public function __construct() {
		parent::__construct();
		$this->load->model('m_options');
		$this->pk = M_options::$pk;
		$this->table = M_options::$table;
	}

	/**
	 * Index
	 * @return Void
	 */
	public function index() {
		$this->vars['title'] = 'Status ' . ucwords(strtolower(__session('_student')));
		$this->vars['academic'] = $this->vars['academic_references'] = $this->vars['student_status'] = true;
		$this->vars['content'] = 'academic/student_status';
		$this->load->view('backend/index', $this->vars);
	}

	/**
	 * Pagination
	 * @return Object
	 */
	public function pagination() {
		if ($this->input->is_ajax_request()) {
			$keyword = trim($this->input->post('keyword', true));
			$page_number = _toInteger($this->input->post('page_number', true));
			$limit = _toInteger($this->input->post('per_page', true));
			$offset = ($page_number * $limit);
			$query = $this->m_options->get_where($keyword, 'student_status', 'rows', $limit, $offset);
			$total_rows = $this->m_options->get_where($keyword, 'student_status');
			$total_page = $limit > 0 ? ceil(_toInteger($total_rows) / _toInteger($limit)) : 1;
			$this->vars['total_page'] = _toInteger($total_page);
			$this->vars['total_rows'] = _toInteger($total_rows);
			$this->vars['rows'] = $query->result();
			$this->output
				->set_content_type('application/json', 'utf-8')
				->set_output(json_encode($this->vars, JSON_HEX_APOS | JSON_HEX_QUOT))
				->_display();
			exit;
		}

	}

	/**
	 * Save | Update
	 * @return Object
	 */
	public function save() {
		if ($this->input->is_ajax_request()) {
			$id = _toInteger($this->input->post('id', true));
			if ($this->validation()) {
				$fill_data = $this->fill_data();
				if (_isNaturalNumber( $id )) {
					$query = $this->model->RowObject($this->pk, $id, $this->table);
					if (!in_array(strtolower($query->option_name), ['lulus', 'aktif'])) {
						$fill_data['updated_by'] = __session('user_id');
						$this->vars['status'] = $this->model->update($id, $this->table, $fill_data) ? 'success' : 'error';
						$this->vars['message'] = $this->vars['status'] == 'success' ? 'updated' : 'not_updated';
					} else {
						$this->vars['status'] = 'info';
						$this->vars['message'] = 'Status peserta didik Lulus dan Aktif tidak dapat diubah !';
					}
				} else {
					if ( ! in_array(strtolower($fill_data['option_name']), ['lulus', 'aktif'])) {
						$fill_data['created_at'] = date('Y-m-d H:i:s');
						$fill_data['created_by'] = __session('user_id');
						$this->vars['status'] = $this->model->insert($this->table, $fill_data) ? 'success' : 'error';
						$this->vars['message'] = $this->vars['status'] == 'success' ? 'created' : 'not_created';
					} else {
						$this->vars['status'] = 'info';
						$this->vars['message'] = 'Status peserta didik '. strtoupper($fill_data['option_name']) .' sudah ada !';
					}
				}
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
			'option_group' => 'student_status',
			'option_name' => $this->input->post('option_name', true)
		];
	}

	/**
	 * Validation Form
	 * @return Boolean
	 */
	private function validation() {
		$this->load->library('form_validation');
		$val = $this->form_validation;
		$val->set_rules('option_name', 'Status ' . __session('_student'), 'trim|required');
		$val->set_message('required', '{field} harus diisi');
		$val->set_error_delimiters('<div>&sdot; ', '</div>');
		return $val->run();
	}
}
