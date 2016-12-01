<?php echo $header; ?>

<!-- Magnific Popup CSS tema -->
<link rel="stylesheet" href="popup/magnific-popup.css">

<script src="popup/jquery.magnific-popup.js" type="text/javascript"></script>
<script src="popup/jquery.magnific-popup.min.js" type="text/javascript"></script>

<script>

  $(document).ready(function() {
    $('.popup-gallery').magnificPopup({
      delegate: 'a',
      type: 'image',
      tLoading: 'Loading image #%curr%...',
      mainClass: 'mfp-img-mobile',
      gallery: {
        enabled: true,
        navigateByImgClick: true,
        preload: [0,1] // Will preload 0 - before current, and 1 after the current image
      },
      image: {
        tError: '<a href="%url%">The image #%curr%</a> could not be loaded.',
        titleSrc: function(item) {
          return item.el.attr('title') + '';
        }
      }
    });
  });

</script>

<style>

  .img-galery{
    min-height: 200px;
  }

  .top20px{
    margin-top: 20px;
  }

  .bottom10px{
    margin-bottom: 10px;
  }

  .text-galery{
    padding-top: 10px;
    font-size: 16px;
  }

  .img-link{
    -webkit-transition: 0.2s ease;
    -moz-transition: 0.2s ease;
    -o-transition: 0.2s ease;
    transition: all linear .2s;
  }

  .img-link:hover{
    -webkit-transform: scale(1.03);
    -webkit-transition: 0.3s ease;
    -moz-transition: 0.3s ease;
    -moz-transform: scale(1.03);
    -o-transition: 0.3s ease;
    -o-transform: scale(1.03);
    transition: all linear .3s;
  }

</style>

<div class="bread-cases">
  <div class="container">
      <ul class="breadcrumb">
        <div class="font-cases">Galeria</div>
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
          <li class="teste"><a href="<?php echo $breadcrumb['href']; ?>" class="a-breadcrumb"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
  </div>
</div>

<?php if(isset($imagens)){ ?>
  <div class="container top20px">
    <div class="row">
      <div class="popup-gallery">
        <?php foreach($imagens as $foto){ ?>
          <a href="image/<?php echo $foto['foto']; ?>">
            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3 bottom10px img-link">
              <div class="img-galery" style="background: url('image/<?php echo $foto['foto']; ?>')no-repeat;background-size: cover;background-position: center;">
              </div>
              <div class="text-galery"><?php echo $foto['titulo_foto']; ?></div>
            </div>
          </a>
        <?php } ?>
      </div>
    </div>
  </div>
<?php } ?>

<?php echo $footer; ?>
