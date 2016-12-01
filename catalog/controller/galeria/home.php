<?php
class ControllerGaleriaHome extends Controller {
	public function index() {

		$this->document->setTitle('Galeria');

		$this->load->model('galeria/home');

		$galeria = $this->model_galeria_home->getGaleria();

		foreach ($galeria as $imagens) {
			$data['imagens'][] = array(
				'titulo_foto'				=> $imagens['titulo_foto'],
				'foto'							=> $imagens['foto']
			);
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => 'Galeria',
			'href' => $this->url->link('information/cases')
		);


		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('default/template/galeria/home.tpl', $data));
	}
}
