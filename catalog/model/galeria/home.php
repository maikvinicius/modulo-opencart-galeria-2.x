<?php
class ModelGaleriaHome extends Model {

	public function getGaleria() {
		$query = $this->db->query("SELECT * FROM ". DB_PREFIX ."galeria ORDER BY ordem");

		return $query->rows;
	}

}
