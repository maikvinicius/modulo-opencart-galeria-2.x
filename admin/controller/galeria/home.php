<?php
class ControllerGaleriaHome extends Controller {

	private $error = array();

	public function index() {

		$this->load->language('galeria/home');
		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('galeria/home');

		$imagens = $this->model_galeria_home->getImages();

		foreach ($imagens as $img) {
			$data['imagem'][] = array(
			'id_foto'			=> 	$img['id_foto'],
			'titulo_foto' =>	$img['titulo_foto'],
			'foto' 				=>	$img['foto'],
			'ordem' 			=>	$img['ordem']
			);
		}

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {

			$this->model_galeria_home->setImage($this->request->post, $this->request->files);

			$data['resposta'] = 'Imagens cadastradas com sucesso!';

		}

		$data['action'] = $this->url->link('galeria/home', 'token=' . $this->session->data['token'], 'SSL');
		$data['token'] = $this->session->data['token'];
		$data['heading_title'] = $this->language->get('heading_title');
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('galeria/home.tpl', $data));

	}

	public function salvar(){

		$this->load->model('galeria/home');

		$data = array();

		$data['id_foto'] = $this->request->post['id_foto'];
		$data['titulo_foto'] = $this->request->post['titulo'];
		$data['ordem'] = $this->request->post['ordem'];

		$this->model_galeria_home->updateImage($data);

		$json = array(
			'sucesso' => 'ok'
		);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));

	}

	public function remover(){

		$this->load->model('galeria/home');

		$data = array();

		$data['id_foto'] = $this->request->post['id_foto'];
		$data['titulo_foto'] = $this->request->post['titulo'];
		$data['ordem'] = $this->request->post['ordem'];

		$this->model_galeria_home->deleteImage($data);

		$json = array(
			'sucesso' => 'ok'
		);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));

	}

}
