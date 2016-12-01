<?php
class ModelGaleriaHome extends Model {

  public function getImages() {
    $galeria = $this->db->query("SELECT * FROM " . DB_PREFIX . "galeria ORDER BY ordem");

    return $galeria->rows;
  }

  public function updateImage($data){
    $this->db->query("UPDATE " . DB_PREFIX . "galeria SET titulo_foto='".$data['titulo_foto']."', ordem='".$data['ordem']."' WHERE id_foto = '".$data['id_foto']."' ");
  }

  public function deleteImage($data){
    $this->db->query("DELETE FROM " . DB_PREFIX . "galeria WHERE id_foto = '".$data['id_foto']."'");
  }

	public function setImage($data, $files) {

    function reArrayFiles($file)
    {
        $file_ary = array();
        $file_count = count($file['name']);
        $file_key = array_keys($file);

        for($i=0;$i<$file_count;$i++)
        {
            foreach($file_key as $val)
            {
                $file_ary[$i][$val] = $file[$val][$i];
            }
        }
        return $file_ary;
    }

    $file_ary = reArrayFiles($files['imagens']);

    $I = 0;

    foreach ($file_ary as $file) {

     if(isset($file['name']) && $file['error'] != 4){

       /*img_proposta*/
       $nome_arquivo = $file['name'];
       $tamanho_arquivo =$file['size'];
       $arquivo_temporario =$file['tmp_name'];
       $ext = strrchr($nome_arquivo,'.');
       $img="galeria/img".date("dmYHms").$I.$ext;

       //Criando um array com as estensões permitidas
       $EstPermitidas = array(".gif",".jpg",".png",".tif",".JPG",".jpge",".JPGE",".PNG");

       if($tamanho_arquivo>0){
         if(in_array($ext,$EstPermitidas)){
             if(move_uploaded_file($arquivo_temporario, DIR_IMAGE."$img"))
             {
               $I++;

               $ultima_posicao = $this->db->query("SELECT * FROM " . DB_PREFIX . "galeria ORDER BY ordem DESC LIMIT 1");

               if($ultima_posicao->num_rows != 0){
                 $total = $ultima_posicao->rows[0]['ordem'] + 1;
               }else{
                 $total = $I;
               }

               $this->db->query("INSERT INTO " . DB_PREFIX . "galeria (titulo_foto, foto, ordem) VALUES ('".$data['titulo']."', '".$img."', '".$total."')");
             }
         }else{
           $this->error['imagem'] = 'Ext logo';
         }
       }

     }else{
       $img = null;
     }

   }

    //return $I;//$query->rows;
  }

}
