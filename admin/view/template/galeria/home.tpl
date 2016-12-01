<?php echo $header; ?><?php echo $column_left; ?>
  <div id="content">
    <div class="page-header">
      <div class="container-fluid">
        <h1><?php echo $heading_title; ?></h1>
      </div>
    </div>
    <div class="container-fluid">
      <div class="panel panel-default">
        <div class="panel-heading">
          <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $heading_title; ?></h3>
        </div>
        <div class="panel-body">
          <div class="table-responsive">

            <form name="orcamento" id="orcamento" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
              <div class="form-group">
                <label>Título das imagens!</label>
                <input type="text" name="titulo" class="form-control">
              </div>
              <div class="form-group">
                <label>Selecione as imagens!</label>
                <input type="file" name="imagens[]" class="form-control" multiple>
              </div>
              <div class="form-group">
                <button type="submit" class="btn btn-success">Enviar</button>
              </div>
            </form>

            <table id="images" class="table table-striped table-bordered table-hover">
            <thead>
              <tr>
                <td class="text-left">Título</td>
                <td class="text-left">Imagem</td>
                <td class="text-right">Posição</td>
                <td></td>
              </tr>
            </thead>
            <tbody>
              <?php
              if(isset($imagem)){
                foreach ($imagem as $img) { ?>
              <tr id="segura-img<?php echo $img['id_foto'];?>">
                <td class="text-left">
                  <div class="input-group pull-left">
                    <span class="input-group-addon">
                      <img src="view/image/flags/br.png" title="Português (BR)">
                    </span>
                    <input type="text" name="titulo<?php echo $img['id_foto'];?>" id="titulo<?php echo $img['id_foto'];?>" value="<?php echo $img['titulo_foto'];?>" placeholder="Título" class="form-control">
                  </div>
                </td>
                <td class="text-left">
                  <img src='../image/<?php echo $img['foto'];?>' class='img-responsive' style="max-width:300px;">
                </td>
                <td class="text-right" style="width: 10%;">
                  <input type="text" name="ordem<?php echo $img['id_foto'];?>" id="ordem<?php echo $img['id_foto'];?>" value="<?php echo $img['ordem'];?>" placeholder="Posição" class="form-control">
                </td>
                <td class="text-left">
                  <button type="submit" form="form-banner" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Salvar" onclick="salvar(<?php echo $img['id_foto'];?>)">
                    <i class="fa fa-save"></i>
                  </button>
                  <button type="button" data-toggle="tooltip" title="" class="btn btn-danger" data-original-title="Remover" onclick="remover(<?php echo $img['id_foto'];?>)">
                    <i class="fa fa-minus-circle"></i>
                  </button>
                </td>
              </tr>
              <?php } } ?>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>

  <?php if(isset($resposta)){ ?>
    <script>alert('<?php echo $resposta; ?>');</script>
  <?php header('Location: index.php?route=galeria/home&token='.$token); } ?>

  <script type="text/javascript">

    function salvar(id_foto){

      var titulo = $("#titulo"+id_foto).val();
      var ordem = $("#ordem"+id_foto).val();

      var request = $.ajax({//post
        url: "index.php?route=galeria/home/salvar&token=<?php echo $token;?>",
        type: "POST",
        data: {"id_foto": id_foto, "titulo": titulo, "ordem": ordem},
        dataType: "json"
      });

      request.done(function(data) {//verifica o resultado
        console.log(data);
        alert('Atualizada com sucesso!');
      });

      request.fail(function(jqXHR, textStatus) {//caso haja erro
        alert( "Falha: " + textStatus );
      });

    }

    function remover(id_foto){

      var titulo = $("#titulo"+id_foto).val();
      var ordem = $("#ordem"+id_foto).val();

      var request = $.ajax({//post
        url: "index.php?route=galeria/home/remover&token=<?php echo $token;?>",
        type: "POST",
        data: {"id_foto": id_foto, "titulo": titulo, "ordem": ordem},
        dataType: "json"
      });

      request.done(function(data) {//verifica o resultado
        console.log(data);
        alert('Removida com sucesso!');
        $( "#segura-img"+id_foto ).remove();
      });

      request.fail(function(jqXHR, textStatus) {//caso haja erro
        alert( "Falha: " + textStatus );
      });

    }

  </script>

<?php echo $footer; ?>
