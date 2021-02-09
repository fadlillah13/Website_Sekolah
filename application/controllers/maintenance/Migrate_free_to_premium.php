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

class Migrate_free_to_premium extends CI_Controller {

	private $DB1;
	private $DB2;

	/**
	 * Class Constructor
	 *
	 * @return Void
	 */
	public function __construct() {
		parent::__construct();
		// if (__session('user_type') !== 'super_user')
  //     	redirect(base_url());
		$this->DB1 = $this->load->database('db1', TRUE); // Old Database
		$this->DB2 = $this->load->database('default', TRUE); // Current Database
	}

	/**
	 * @access  public
	 */
	public function index() {
		// $this->employees();
		// $this->photos();
		// $this->menus();
		// $this->posts();
		// $this->albums();
		// $this->tags();
		// $this->image_sliders();
		// $this->post_categories();
		$this->students();
		// $this->prospective_students();
		// $this->class_groups();
		// $this->contact_us();
		// $this->quotes();
		// $this->settings();
		// $this->opening_speech();
	}

	/**
	 * Migrate employees
	 * SOURCE TABLE 	: employees
	 * TARGET TABLE 	: employees
	 * @access  public
	 */
	private function employees() {
		$this->DB2->truncate('employees');
		$query = $this->DB1->query("SELECT * FROM employees");
		foreach($query->result() as $row) {
			$data = [
				'created_at' => $row->created_at,
			   'updated_at' => $row->updated_at,
			   'deleted_at' => $row->deleted_at,
			   'restored_at' => $row->restored_at,
			   'created_by' => $row->created_by,
			   'updated_by' => $row->updated_by,
			   'deleted_by' => $row->deleted_by,
			   'restored_by' => $row->restored_by,
			   'is_deleted' => $row->is_deleted,
				'id' => $row->id,
				'assignment_letter_number' => $row->assignment_letter_number,
				'assignment_letter_date' => $row->assignment_letter_date,
				'assignment_start_date' => $row->assignment_start_date,
				'parent_school_status' => $row->parent_school_status,
				'full_name' => $row->full_name,
				'gender' => $row->gender,
				'nik' => $row->nik,
				'birth_place' => $row->birth_place,
				'birth_date' => $row->birth_date,
				'mother_name' => $row->mother_name,
				'street_address' => $row->street_address,
				'rt' => $row->rt,
				'rw' => $row->rw,
				'sub_village' => $row->sub_village,
				'village' => $row->village,
				'sub_district' => $row->sub_district,
				'district' => $row->district,
				'postal_code' => $row->postal_code,
				'religion_id' => $row->religion,
				'marriage_status_id' => $row->marriage_status,
				'spouse_name' => $row->spouse_name,
				'spouse_employment_id' => $row->spouse_employment,
				'citizenship' => $row->citizenship,
				'country' => $row->country,
				'npwp' => $row->npwp,
				'employment_status_id' => $row->employment_status,
				'nip' => $row->nip,
				'niy' => $row->niy,
				'nuptk' => $row->nuptk,
				'employment_type_id' => $row->employment_type,
				'decree_appointment' => $row->decree_appointment,
				'appointment_start_date' => $row->appointment_start_date,
				'institution_lifter_id' => $row->institutions_lifter,
				'decree_cpns' => $row->decree_cpns,
				'pns_start_date' => $row->pns_start_date,
				'rank_id' => $row->rank ? $row->rank : 0,
				'salary_source_id' => $row->salary_sources,
				'headmaster_license' => $row->headmaster_license,
				'laboratory_skill_id' => $row->laboratory_skills,
				'special_need_id' => $row->handle_special_needs,
				'braille_skills' => $row->braille_skills,
				'sign_language_skills' => $row->sign_language_skills,
				'phone' => $row->phone,
				'mobile_phone' => $row->mobile_phone,
				'email' => $row->email,
				'photo' => $row->photo
			];
			$this->DB2->insert('employees', $data);
		}
	}

	/**
	 * Migrate photos
	 * SOURCE TABLE 	: photos
	 * TARGET TABLE 	: photos
	 * @access  public
	 */
	private function photos() {
		$this->DB2->truncate('photos');
		$query = $this->DB1->query("SELECT * FROM photos");
		foreach($query->result() as $row) {
			$data = [
				'id' => $row->id,
				'photo_album_id' => $row->photo_album_id,
				'photo_name' => $row->photo_name,
				'created_at' => $row->created_at,
			   'updated_at' => $row->updated_at,
			   'deleted_at' => $row->deleted_at,
			   'restored_at' => $row->restored_at,
			   'created_by' => $row->created_by,
			   'updated_by' => $row->updated_by,
			   'deleted_by' => $row->deleted_by,
			   'restored_by' => $row->restored_by,
			   'is_deleted' => $row->is_deleted
			];
			$this->DB2->insert('photos', $data);
		}
	}

	/**
	 * Migrate menus
	 * SOURCE TABLE 	: menus
	 * TARGET TABLE 	: menus
	 * @access  public
	 */
	private function menus() {
		$this->DB2->truncate('menus');
		$query = $this->DB1->query("SELECT * FROM menus");
		foreach($query->result() as $row) {
			$data = [
				'id' => $row->id,
				'menu_title' => $row->menu_title,
				'menu_url' => $row->menu_url,
				'menu_target' => $row->menu_target,
				'menu_type' => $row->menu_type,
				'menu_parent_id' => $row->parent_id,
				'menu_position' => $row->position,
				'created_at' => $row->created_at,
			   'updated_at' => $row->updated_at,
			   'deleted_at' => $row->deleted_at,
			   'restored_at' => $row->restored_at,
			   'created_by' => $row->created_by,
			   'updated_by' => $row->updated_by,
			   'deleted_by' => $row->deleted_by,
			   'restored_by' => $row->restored_by,
			   'is_deleted' => $row->is_deleted
			];
			$this->DB2->insert('menus', $data);
		}
	}

  /**
	 * Migrate posts
	 * SOURCE TABLE 	: posts
	 * TARGET TABLE 	: posts
	 * @access  public
	 */
	private function posts() {
		$this->DB2->truncate('posts');
		$query = $this->DB1->query("SELECT * FROM posts");
		foreach($query->result() as $row) {
			$data = [
				'id' => $row->id,
				'post_title' => $row->post_title,
				'post_content' => $row->post_content,
				'post_image' => $row->post_image,
				'post_author' => $row->post_author,
				'post_categories' => $row->post_categories,
				'post_type' => $row->post_type,
				'post_status' => $row->post_status,
				'post_visibility' => $row->post_visibility,
				'post_comment_status' => $row->post_comment_status,
				'post_slug' => $row->post_slug,
				'post_tags' => $row->post_tags,
				'post_counter' => $row->post_counter,
				'created_at' => $row->created_at,
			   'updated_at' => $row->updated_at,
			   'deleted_at' => $row->deleted_at,
			   'restored_at' => $row->restored_at,
			   'created_by' => $row->created_by,
			   'updated_by' => $row->updated_by,
			   'deleted_by' => $row->deleted_by,
			   'restored_by' => $row->restored_by,
			   'is_deleted' => $row->is_deleted
			];
			$this->DB2->insert('posts', $data);
		}
	}

	/**
	 * Migrate albums
	 * SOURCE TABLE 	: albums
	 * TARGET TABLE 	: albums
	 * @access  public
	 */
	private function albums() {
		$this->DB2->truncate('albums');
		$query = $this->DB1->query("SELECT * FROM albums");
		foreach($query->result() as $row) {
			$data = [
				'id' => $row->id,
				'album_title' => $row->album_title,
				'album_description' => $row->album_description,
				'album_slug' => $row->album_slug,
				'album_cover' => $row->album_cover,
				'created_at' => $row->created_at,
			   'updated_at' => $row->updated_at,
			   'deleted_at' => $row->deleted_at,
			   'restored_at' => $row->restored_at,
			   'created_by' => $row->created_by,
			   'updated_by' => $row->updated_by,
			   'deleted_by' => $row->deleted_by,
			   'restored_by' => $row->restored_by,
			   'is_deleted' => $row->is_deleted
			];
			$this->DB2->insert('albums', $data);
		}
	}

	/**
	 * Migrate tags
	 * SOURCE TABLE 	: tags
	 * TARGET TABLE 	: tags
	 * @access  public
	 */
	private function tags() {
		$this->DB2->truncate('tags');
		$query = $this->DB1->query("SELECT * FROM tags");
		foreach($query->result() as $row) {
			$data = [
				'id' => $row->id,
				'tag' => $row->tag,
				'slug' => $row->slug,
				'created_at' => $row->created_at,
			   'updated_at' => $row->updated_at,
			   'deleted_at' => $row->deleted_at,
			   'restored_at' => $row->restored_at,
			   'created_by' => $row->created_by,
			   'updated_by' => $row->updated_by,
			   'deleted_by' => $row->deleted_by,
			   'restored_by' => $row->restored_by,
			   'is_deleted' => $row->is_deleted
			];
			$this->DB2->insert('tags', $data);
		}
	}

	/**
	 * Migrate image_sliders
	 * SOURCE TABLE 	: image_sliders
	 * TARGET TABLE 	: image_sliders
	 * @access  public
	 */
	private function image_sliders() {
		$this->DB2->truncate('image_sliders');
		$query = $this->DB1->query("SELECT * FROM image_sliders");
		foreach($query->result() as $row) {
			$data = [
				'id' => $row->id,
				'caption' => $row->caption,
				'image' => $row->image,
				'created_at' => $row->created_at,
			   'updated_at' => $row->updated_at,
			   'deleted_at' => $row->deleted_at,
			   'restored_at' => $row->restored_at,
			   'created_by' => $row->created_by,
			   'updated_by' => $row->updated_by,
			   'deleted_by' => $row->deleted_by,
			   'restored_by' => $row->restored_by,
			   'is_deleted' => $row->is_deleted
			];
			$this->DB2->insert('image_sliders', $data);
		}
	}

	/**
	 * Migrate post_categories
	 * SOURCE TABLE 	: post_categories
	 * TARGET TABLE 	: post_categories
	 * @access  public
	 */
	private function post_categories() {
		$this->DB2->truncate('categories');
		$query = $this->DB1->query("SELECT * FROM post_categories");
		foreach($query->result() as $row) {
			$data = [
				'id' => $row->id,
				'category_name' => $row->category,
				'category_slug' => $row->slug,
				'category_description' => $row->description,
				'category_type' => 'post',
				'created_at' => $row->created_at,
			   'updated_at' => $row->updated_at,
			   'deleted_at' => $row->deleted_at,
			   'restored_at' => $row->restored_at,
			   'created_by' => $row->created_by,
			   'updated_by' => $row->updated_by,
			   'deleted_by' => $row->deleted_by,
			   'restored_by' => $row->restored_by,
			   'is_deleted' => $row->is_deleted
			];
			$this->DB2->insert('categories', $data);
		}
	}

	/**
	 * Migrate students
	 * SOURCE TABLE 	: students
	 * TARGET TABLE 	: students
	 * @access  public
	 */
	private function students() {
		$this->DB2->truncate('students');
		$query = $this->DB1->query("SELECT * FROM students");
		foreach($query->result() as $row) {
			$data = [
				'id' => $row->id,
				'major_id' => $row->major_id ? $row->major_id : 0,
				'first_choice_id' => $row->first_choice,
				'second_choice_id' => $row->second_choice,
				'registration_number' => $row->registration_number,
				// 'admission_exam_number' => $row->admission_exam_number,
				'selection_result' => $row->selection_result,
				'admission_phase_id' => $row->admission_phase_id,
				// 'admission_type_id' => $row->admission_type_id,
				'photo' => $row->photo,
				// 'achievement' => $row->achievement,
				'is_student' => $row->is_student,
				'is_prospective_student' => $row->is_prospective_student,
				'is_alumni' => $row->is_alumni,
				'is_transfer' => $row->is_transfer,
				're_registration' => $row->re_registration,
				'start_date' => $row->start_date,
				'identity_number' => $row->nis,
				'nisn' => $row->nisn,
				'nik' => $row->nik,
				'prev_exam_number' => $row->prev_exam_number,
				'prev_diploma_number' => $row->diploma_number,
				'paud' => $row->paud,
				'tk' => $row->tk,
				'skhun' => $row->skhun,
				// 'prev_school_name' => $row->prev_school_name,
				// 'prev_school_address' => $row->prev_school_address,
				'hobby' => $row->hobby,
				'ambition' => $row->ambition,
				'full_name' => $row->full_name,
				'gender' => $row->gender,
				'birth_place' => $row->birth_place,
				'birth_date' => $row->birth_date,
				'religion_id' => $row->religion,
				'special_need_id' => $row->special_needs,
				'street_address' => $row->street_address,
				'rt' => $row->rt,
				'rw' => $row->rw,
				'sub_village' => $row->sub_village,
				'village' => $row->village,
				'sub_district' => $row->sub_district,
				'district' => $row->district,
				'postal_code' => $row->postal_code,
				'residence_id' => $row->residence,
				'transportation_id' => $row->transportation,
				'phone' => $row->phone,
				'mobile_phone' => $row->mobile_phone,
				'email' => $row->email,
				'sktm' => $row->sktm,
				'kks' => $row->kks,
				'kps' => $row->kps,
				'kip' => $row->kip,
				'kis' => $row->kis,
				'citizenship' => $row->citizenship,
				'country' => $row->country,
				'father_name' => $row->father_name,
				'father_birth_year' => $row->father_birth_year,
				'father_education_id' => $row->father_education,
				'father_employment_id' => $row->father_employment,
				'father_monthly_income_id' => $row->father_monthly_income,
				'father_special_need_id' => $row->father_special_needs,
				'mother_name' => $row->mother_name,
				'mother_birth_year' => $row->mother_birth_year,
				'mother_education_id' => $row->mother_education,
				'mother_employment_id' => $row->mother_employment,
				'mother_monthly_income_id' => $row->mother_monthly_income,
				'mother_special_need_id' => $row->mother_special_needs,
				'guardian_name' => $row->guardian_name,
				'guardian_birth_year' => $row->guardian_birth_year,
				'guardian_education_id' => $row->guardian_education,
				'guardian_employment_id' => $row->guardian_employment,
				'guardian_monthly_income_id' => $row->guardian_monthly_income,
				'mileage' => $row->mileage,
				'traveling_time' => $row->traveling_time,
				'height' => $row->height,
				'weight' => $row->weight,
				'sibling_number' => $row->sibling_number,
				'student_status_id' => $row->student_status ? $row->student_status : 0,
				'created_at' => $row->created_at,
			   'updated_at' => $row->updated_at,
			   'deleted_at' => $row->deleted_at,
			   'restored_at' => $row->restored_at,
			   'created_by' => $row->created_by,
			   'updated_by' => $row->updated_by,
			   'deleted_by' => $row->deleted_by,
			   'restored_by' => $row->restored_by,
			   'is_deleted' => $row->is_deleted
			];
			$this->DB2->insert('students', $data);
		}
	}
}
