<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
</head>
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h4 class="modal-title">Compose Message</h4>
          </div>
          <div class="modal-body">
            <form role="form" class="form-horizontal">
                <div class="form-group">
                  <label class="col-sm-2" for="inputSubject">Subject</label>
                  <div class="col-sm-10"><input type="text" class="form-control" id="inputSubject" placeholder="subject"></div>
                </div>
                <div class="form-group">
                  <label class="col-sm-12" for="inputBody">Message</label>
                  <div class="col-sm-12"><textarea class="form-control" id="inputBody" rows="10"></textarea></div>
                </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default pull-right" data-dismiss="modal">Cancel</button> 
            <!-- <button type="button" class="btn btn-warning pull-left">Save Draft</button>-->
            <a type="button" class="btn btn-primary" id="confrim-mail">submit <i class="fa fa-arrow-circle-right fa-lg"></i></a>
            
          </div>
        </div><!-- /.modal-content -->
        </div>
        </div>