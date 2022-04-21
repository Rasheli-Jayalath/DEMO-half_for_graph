<?php 
include_once("config/config.php");
include_once("rs_lang.admin.php");
$objSDb  		= new Database();
$objCommon 		= new Common();
$objAdminUser 	= new AdminUser();
$objDb  		= new ProjectSetup();
$objPD  		= new ProjectSetup();
$objDbc  		= new ProjectSetup();
$objDdb  		= new ProjectSetup();
$objNews 		= new News();
 if($objAdminUser->ne_is_login != true){
	 header("Location:pages/user-access-manage/signin.php");
  }
  else
  {
  $eSql = "Select * from project";
$objSDb->dbQuery($eSql);
$eCount = $objSDb->totalRecords();
if($eCount == 0)
{
header("location:pages/Administration/Data_Updation/project_details.php");
}
  }
 $objPD->getProject();
  $PCount=$objPD->totalRecords();
  
  if($PCount==1)
  {
	   while ($prows = $objPD->dbFetchArray()) {
	  $pid 						= $prows['pid'];
	  $pcode 					= $prows['pcode'];
	 // $pname	 				= $prows['pname'];
	  $pdetail					= $prows['pdetail'];
	  $ptype					= $prows['ptype'];
	  $pstart 					= $prows['pstart'];
	  $pend 					= $prows['pend'];
	  $client					= $prows['client'];
	  $funding_agency			= $prows['funding_agency'];
	  $contractor				= $prows['contractor'];
	  $pcost					= $prows['pcost'];
	  $ssector_id				= $prows['sector_id'];
	  if($ssector_id!=0)
	  {
		 $objDb->setProperty("sector_id",$ssector_id);
		 $objDb->getSector();
		 $secrows = $objDb->dbFetchArray();
		 $sector_name = $secrows['sector_name'];
			
	  }
	  $scountry_id				= $prows['country_id'];
	  if($scountry_id!=0)
	  {
		  $objDb->setProperty("country_id",$scountry_id);
		  $objDb->getCountry();
		   $crows = $objDb->dbFetchArray();
		  $country_name = $crows['country_name'];
	  }
	  $consultant				=$prows['consultant'];
	  $location				    =$prows['location'];
	  $smec_code				=$prows['smec_code'];
	}
	$objDbc->getCurrency();
				 $cur_rows=$objDbc->dbFetchArray();
				  $pcid 					= $cur_rows['pcid'];
			    $cur_1_rate 					= $cur_rows['cur_1_rate'];
			    $cur_2_rate 					= $cur_rows['cur_2_rate'];
				$cur_3_rate 					= $cur_rows['cur_3_rate'];
			    $cur_1 					= $cur_rows['cur_1'];
			    $cur_2 					= $cur_rows['cur_2'];
				$cur_3 					= $cur_rows['cur_3'];
			    $base_cur 				= $cur_rows['base_cur'];
  } ?>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>PMIS</title>
  <!-- plugins:css -->
 <!-- plugins:css -->
  <link rel="stylesheet" href="vendors/feather/feather.css">
  <link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="vendors/typicons/typicons.css">
  <link rel="stylesheet" href="vendors/simple-line-icons/css/simple-line-icons.css">
  <link rel="stylesheet" href="vendors/css/vendor.bundle.base.css">
   <script src="vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <!-- <link rel="stylesheet" href="vendors/datatables.net-bs4/dataTables.bootstrap4.css"> -->
  <!-- <link rel="stylesheet" href="js/select.dataTables.min.css"> -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="css/vertical-layout-light/style.css">
  <link rel="stylesheet" href="css/basic-styles.css">
 <!-- endinject -->
 
<link rel="stylesheet" type="text/css" href="engine1/style.css" />
<!--/*<script type="text/javascript" src="engine1/jquery.js"></script>*/-->

  <script src="js/jquery.min.js"></script>
  <script type="text/javascript" src="datepickercode/jquery-ui.js"></script>
 <script src="highcharts/js/highcharts.js"></script>
<script src="highcharts/js/modules/exporting.js"></script>
<script src="highcharts/js/modules/jquery.highchartTable.js"></script>
<script src="highcharts/js/highcharts-more.js"></script>



  <link rel="shortcut icon" href="images/favicon.png" />
  
<script type="text/javascript">
$(function () {
        $('#container1').highcharts({
            chart: {
                type: 'spline'
            },
            title: {
                text: ''
            },
            subtitle: {
                text: 'Planned Vs. Actual (June 2019)'
            },
            xAxis: {
                type: 'datetime',
                dateTimeLabelFormats: { // don't display the dummy year
                     month: '%m-%Y',
                	 year: '%Y'
                }
            },
            yAxis: {
                title: {
                    text: '% Done'
                },
                min: 0
            },
            tooltip: {
                formatter: function() {
                        return '<b>'+ this.series.name +'</b><br/>'+
                        Highcharts.dateFormat('%d-%m-%Y', this.x) +': '+ this.y +' ';
                }
            },
            legend: {
            layout: 'vertical',
            align: 'left',
            x: 90,
            verticalAlign: 'top',
            y: 50,
            floating: true/*,
            backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'*/
        },
            series: [
		{
                name: 'Actual Progress: <span style="color:blue">83.25%</span>',
                
                data: [
				[Date.UTC(2018,0,31) , 15822539326 ] , [Date.UTC(2018,1,28) , 18058657603 ] , [Date.UTC(2018,2,31) , 20553062069 ] , [Date.UTC(2018,3,30) , 23232964717 ] , [Date.UTC(2018,4,31) , 26094976638 ] , [Date.UTC(2018,5,30) , 29085254802 ] , [Date.UTC(2018,6,31) , 32245723186 ] , [Date.UTC(2018,7,31) , 35539956156 ] , [Date.UTC(2018,8,30) , 39159349810 ] , [Date.UTC(2018,9,31) , 43314963764 ] , [Date.UTC(2018,10,30) , 47934826554 ] , [Date.UTC(2018,11,31) , 53286411988 ] , [Date.UTC(2019,0,31) , 58996725922 ] , [Date.UTC(2019,1,28) , 65012115923 ] , [Date.UTC(2019,2,31) , 71275331659 ] , [Date.UTC(2019,3,30) , 77785569776 ] , [Date.UTC(2019,4,31) , 84649994945 ] , [Date.UTC(2019,5,30) , 91791462004 ] , [Date.UTC(2019,6,31) , 99152830525 ] , [Date.UTC(2019,7,31) , 106614299275 ] , [Date.UTC(2019,8,30) , 114193142558 ] , [Date.UTC(2019,9,31) , 121881049695 ] , [Date.UTC(2019,10,30) , 129666083491 ] , [Date.UTC(2019,11,31) , 137485218691 ] , [Date.UTC(2020,0,31) , 145462037812 ]       
                ],
				marker: {
               
                 radius : 1
            }
            }
			
			,{
                name: 'Planned: <span style="color:blue">88.56%</span>',
                data: [
				[Date.UTC(2018,0,31) , 36815353361 ] , [Date.UTC(2018,1,28) , 40232251334 ] , [Date.UTC(2018,2,31) , 43882243686 ] , [Date.UTC(2018,3,30) , 47757811243 ] , [Date.UTC(2018,4,31) , 51866473180 ] , [Date.UTC(2018,5,30) , 56200710322 ] , [Date.UTC(2018,6,31) , 60768041843 ] , [Date.UTC(2018,7,31) , 65569100206 ] , [Date.UTC(2018,8,30) , 70597089045 ] , [Date.UTC(2018,9,31) , 75859572713 ] , [Date.UTC(2018,10,30) , 81348986858 ] , [Date.UTC(2018,11,31) , 87072895831 ] , [Date.UTC(2019,0,31) , 93031299632 ] , [Date.UTC(2019,1,28) , 99201505212 ] , [Date.UTC(2019,2,31) , 105606205619 ] , [Date.UTC(2019,3,30) , 112237836504 ] , [Date.UTC(2019,4,31) , 119103962217 ] , [Date.UTC(2019,5,30) , 126197018408 ] , [Date.UTC(2019,6,31) , 133524569426 ] , [Date.UTC(2019,7,31) , 141086615273 ] , [Date.UTC(2019,8,30) , 148875591597 ] , [Date.UTC(2019,9,31) , 156899062749 ] , [Date.UTC(2019,10,30) , 165149464379 ] , [Date.UTC(2019,11,31) , 173634360836 ] , [Date.UTC(2020,0,31) , 182352666626 ] , [Date.UTC(2020,1,29) , 191289323083 ] , [Date.UTC(2020,2,31) , 200455253550 ] , [Date.UTC(2020,3,30) , 209822252091 ] , [Date.UTC(2020,4,31) , 219345248388 ] , [Date.UTC(2020,5,30) , 228926290950 ] , [Date.UTC(2020,6,31) , 238507514215 ]                  
                ]
            ,
				marker: {
               
                 radius : 1
            }}
			
			]
        });
    });
    

		</script>
 <!-- endinject -->
  <link rel="shortcut icon" href="images/favicon.png" />
</head>
<body>
  <div class="container-scroller"> 
    
    <!-- partial:partials/_navbar.html -->
    <div id="partials-navbar"></div>
    <!-- partial -->

    <div class="container-fluid page-body-wrapper" id="pagebodywraper">

      <!-- partial:partials/_settings-panel.html -->
      <div id="partials-theme-setting-wrapper"></div>
      <!-- partial -->

      <!-- partial:partials/_sidebar.html -->
      <div class="sidebar sidebar-offcanvas" id="partials-sidebar-offcanvas"></div>
      <!-- partial -->

      <!-- Main Panel Starts -->

      <div class="main-panel" id="mainpanel">
        <div class="content-wrapper">
          <div class="row">
            <div class="col-sm-12">
              <div class="home-tab">
                <div class="d-sm-flex align-items-center justify-content-between border-bottom">
                  <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                      <a class="nav-link active ps-0" id="home-tab" data-bs-toggle="tab" href="#overview" role="tab" aria-controls="overview" aria-selected="true">Dashboard</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" id="profile-tab" data-bs-toggle="tab" href="#audiences" role="tab" aria-selected="false">Project Overview</a>
                    </li>
                      <li class="nav-item">
                      <a class="nav-link border-0" id="logs-tab" data-bs-toggle="tab" href="#logs" role="tab" aria-selected="false">Logs
                      </a>
                    </li>
                  </ul>
                  <div>
                    <div class="btn-wrapper">
                      <a href="#" class="btn btn-otline-dark align-items-center"><i class="icon-share"></i> Share</a>
                      <a href="#" class="btn btn-otline-dark"><i class="icon-printer"></i> Print</a>
                      <a href="#" class="btn btn-primary text-white me-0"><i class="icon-download"></i> Export</a>
                    </div>
                  </div>
                </div>
                <div class="tab-content tab-content-basic">
                  <div class="tab-pane fade show active" id="overview" role="tabpanel" aria-labelledby="overview"> 
                    <div class="row">
                      <div class="col-sm-12" style="height:90px">
                        <div class="statistics-details d-flex align-items-center justify-content-between">
                        <div class="d-none d-md-block">
                            <p class="statistics-title">Planned Progress</p>
                            <h3 class="rate-percentage"><?php echo "0 %";?></h3>
                            <p class="text-success d-flex"><i class="mdi mdi-menu-down"></i><span>This Month: 0%</span></p>
                          </div>
                        <div>
                            <p class="statistics-title">Physical Progress</p>
                            <h3 class="rate-percentage">0%</h3>
                            <p class="text-danger d-flex"><i class="mdi mdi-menu-down"></i><span>Gap: 0%</span></p>
                          </div>
                          
                          <div>
                            <p class="statistics-title">Financial Progress</p>
                            <h3 class="rate-percentage">0 %</h3>
                            <p class="text-success d-flex"><i class="mdi mdi-menu-up"></i><span>0%</span></p>
                          </div>

                        <div>
                            <p class="statistics-title">Total Payment</p>
                            <h3 class="rate-percentage"><?php echo "0 M";?></h3>
                            <p class="text-success d-flex"><i class="mdi mdi-menu-down"></i><span></span></p>
                          </div>
                          <div class="d-none d-md-block">
                            <p class="statistics-title">Last Payment(This Month)</p>
                            <h3 class="rate-percentage"><?php echo "0 M";?></h3>
                            <p class="text-success d-flex"><i class="mdi mdi-menu-down"></i><span></span></p>
                          </div>
                          <div class="d-none d-md-block">
                            <p class="statistics-title">Last Updated</p>
                            <h3 class="rate-percentage"><?php echo date('d, F, Y');?> </h3>
                            <p class="text-success d-flex"><i class="mdi mdi-menu-down"></i><span></span></p>
                          </div>
                          
                                                    
                          
                        </div>
                      </div>
                    </div> 
                    <div class="row">
                      <!--<div class="col-lg-8 d-flex flex-column">
                        <div class="row flex-grow">
                          <div class="col-12 col-lg-12 grid-margin grid-margin-md-1 stretch-card">
                            <div class="card card-rounded">
                              <div class="card-body">
                               
                                  <div id="container1"></div>
                                 
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>-->
                      <div class="col-lg-8 d-flex flex-column">
                        <div class="row flex-grow">
                          <div class="col-12 col-lg-4 col-lg-12 grid-margin stretch-card">
                            <div class="card card-rounded">
                              <div class="card-body">
                                <div class="d-sm-flex justify-content-between align-items-start">
                                  <div>
                                   <h4 class="card-title card-title-dash">Physical Progress </h4>
                                   <h5 class="card-subtitle card-subtitle-dash">Planned Vs. Actual</h5>
                                  </div>
                                  <div id="performance-line-legend"></div>
                                </div>
                                <div class="chartjs-wrapper mt-5">
                                  <canvas id="performaneLine"></canvas>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4 d-flex flex-column">
                        <div class="row flex-grow">
                        <div class="col-12 grid-margin stretch-card">
                            <div class="card card-rounded">
                              <div class="card-body">
                                <div class="row">
                                  <div class="col-lg-12">
                                    <div class="d-flex justify-content-between align-items-center">
                                      <h4 class="card-title card-title-dash">Latest Project Issues</h4>
                                     
                                    </div>
                                    <div class="list-wrapper">
                                   <?php /*?> <marquee id="MARQUEE1" style="text-align: left; float: left; height: 210px;" scrollamount="4" onmouseout="this.start();" onmouseover="this.stop();" direction="up" behavior="scroll"><?php */?>
                                      <ul class="todo-list todo-list-rounded">
                                      <?php $swwSQL = "Select * from t012issues where iss_status<>0 order by nos_id DESC LIMIT 0,3";
							 $objSDb->dbQuery($swwSQL);
							  $issCount = $objSDb->totalRecords();
							  if($issCount>0)
							  {
							  while($iss_rows= $objSDb->dbFetchArray())
							  { ?>
                                        <li class="d-block">
                                          <div class="form-check w-100">
                                            <label class="form-check-label">
                                              <?php echo trim($iss_rows['iss_title']);?><i class="input-helper rounded"></i>
                                            </label>
                                            <div class="d-flex mt-2">
                                              <div class="ps-4 text-small me-3"> <?php echo date('d, F, Y',strtotime($iss_rows['iss_date']));?></div>
                                              <div class="badge <?php if($iss_rows['action_status']==1) 
												  {
													  echo 'badge-opacity-success"'; 
												  }
											  else { echo 'badge-opacity-warning"';
											       }?> me-3"><?php 
											  if($iss_rows['action_status']==1) 
												  {
													  echo "Resolved"; 
												  }
											  else { echo "Pending";
											       }?></div>
                                            </div>
                                          </div>
                                        </li> 
                                        <?php }
							  }?>
                              <br/>
                                      </ul>
                                    <?php /*?>  </marquee><?php */?>
                                    <div class="list align-items-right pt-3">
                                  <div class="wrapper w-100">
                                    <p class="mb-0">
                                      
                                    </p>
                                  </div>
                                </div>
                                    </div>
                                    
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                     
                        </div>
                      </div>
                      
                    </div>
                    <div class="row">
                      <div class="col-lg-8 d-flex flex-column">
                        <div class="row flex-grow">
                          <div class="col-12 grid-margin stretch-card">
                            <div class="card card-rounded">
                              <div class="card-body">
                                <div class="d-sm-flex justify-content-between align-items-start">
                                  <div>
                                    <h4 class="card-title card-title-dash">Financial Progress </h4>
                                   <p class="card-subtitle card-subtitle-dash">Total Financial Dispursement Todate</p>
                                  </div>
                                  <div>
                                    <div class="dropdown">
                                      <button class="btn btn-secondary dropdown-toggle toggle-dark btn-lg mb-0 me-0" type="button" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> This month </button>
                                      <div class="dropdown-menu" aria-labelledby="dropdownMenuButton2">
                                        <h6 class="dropdown-header">Settings</h6>
                                        <a class="dropdown-item" href="#">Action</a>
                                        <a class="dropdown-item" href="#">Another action</a>
                                        <a class="dropdown-item" href="#">Something else here</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#">Separated link</a>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                                <div class="d-sm-flex align-items-center mt-1 justify-content-between">
                                  <div class="d-sm-flex align-items-center mt-4 justify-content-between"><h2 class="me-2 fw-bold">0</h2><h4 class="me-2"></h4><h4 class="text-success"></h4></div>
                                  <div class="me-3"><div id="marketing-overview-legend"></div></div>
                                </div>
                                <div class="chartjs-bar-wrapper mt-3">
                                  <canvas id="marketingOverview"></canvas>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="row flex-grow" >
                         <div class="col-12 grid-margin stretch-card">
                          <!-- Start WOWSlider.com BODY section -->
<div id="wowslider-container1">

  

<div class="ws_images"><ul>
		<li><img src="data1/images/11.jpg" alt="1" title="1" id="wows1_0"/></li>
		
		<!-- <li><img src="data1/images/banner1.jpg" alt="banner1" title="banner1" id="wows1_3"/></li>
		<li><a href="http://wowslider.net"><img src="data1/images/banner1a.jpg" alt="responsive slider" title="banner1a" id="wows1_4"/></a></li>
		<li><img src="data1/images/banner3.jpg" alt="banner3" title="banner3" id="wows1_5"/></li>
   -->
	</ul>

</div>
	<div class="ws_bullets"><div>
		<a href="#" title="1"><span><img src="data1/tooltips/11.jpg" alt="1"/>1</span></a>
		
		<!-- <a href="#" title="banner1"><span><img src="data1/tooltips/banner1.jpg" alt="banner1"/>4</span></a>
		<a href="#" title="banner1a"><span><img src="data1/tooltips/banner1a.jpg" alt="banner1a"/>5</span></a>
		<a href="#" title="banner3"><span><img src="data1/tooltips/banner3.jpg" alt="banner3"/>6</span></a> -->

	</div>
</div>
<!-- <div class="ws_script" style="position:absolute;left:-99%"><a href="http://wowslider.net">slider html</a> by WOWSlider.com v9.0</div> -->

<!-- <div class="ws_shadow"></div> -->

</div>	
<script type="text/javascript" src="engine1/wowslider.js"></script>
<script type="text/javascript" src="engine1/script.js"></script>

<!-- End WOWSlider.com BODY section -->
						</div>
                        </div>
                       
                      </div>
                      <div class="col-lg-4 d-flex flex-column">
                            
                          <div class="col-md-6 col-lg-12 grid-margin stretch-card">
                            <div class="card card-rounded">
                              <div class="card-body">
                                <div class="row">
                                  <div class="col-sm-6">
                                    <div class="d-flex justify-content-between align-items-center mb-2 mb-sm-0">
                                      <div class="circle-progress-width">
                                        <div id="totalVisitors" class="progressbar-js-circle pr-2"></div>
                                      </div>
                                      <div>
                                        <p class="text-small mb-2"><strong>CPI</strong></p>
                                        <h4 class="mb-0 fw-bold">0</h4>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="col-sm-6">
                                    <div class="d-flex justify-content-between align-items-center">
                                      <div class="circle-progress-width">
                                        <div id="visitperday" class="progressbar-js-circle pr-2"></div>
                                      </div>
                                      <div>
                                        <p class="text-small mb-2"><strong>SPI</strong></p>
                                        <h4 class="mb-0 fw-bold">0</h4>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                         <div class="col-md-6 col-lg-12 grid-margin stretch-card">
                            <div class="card card-rounded">
                              <div class="card-body">
                                <h4 class="card-title  card-title-dash">Recent Events</h4>
                                <?php
 	$objNews->setProperty("status", "Y");
	$objNews->setProperty("orderby", "newsdate desc");
	$objNews->setProperty("limit", 6);
	$objNews->lstNews();
	$Sql = $objNews->getSQL();
	if($objNews->totalRecords() >= 1){
		$sno = 1;
		while($rows = $objNews->dbFetchArray(1)){
			
			?>
                                <div class="list align-items-center border-bottom py-2">
                                  <div class="wrapper w-100">
                                    <p class="mb-2 font-weight-medium">
                                      <?php echo $rows['title'];?>
                                    </p>
                                    <div class="d-flex justify-content-between align-items-center">
                                      <div class="d-flex align-items-center">
                                        <i class="mdi mdi-calendar text-muted me-1"></i>
                                        <p class="mb-0 text-small text-muted"><?php echo $rows['newsdate'];?></p>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                                <?php } }?>
                                                                <div class="list align-items-center pt-3">
                                  <div class="wrapper w-100">
                                    <p class="mb-0">
                                      <a href="#" class="fw-bold text-primary">Show all <i class="mdi mdi-arrow-right ms-2"></i></a>
                                    </p>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div> 
                      </div>
                    </div>
                  </div>
                  <div class="tab-pane fade show" id="audiences" role="tabpanel" aria-labelledby="audiences"> 
                     
                    <div class="row">
            
            <div class="col-md-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Project Details</h4>
                 
                  <div class="template-demo">
                   <div class="chartjs-bar-wrapper mt-3">
                                <table class="table table-striped">
                                   <tr>
              <td width="16%" ><strong>Project code:</strong></td>
              <td ><?php echo $pcode; ?></td>
        </tr>
           <tr>
              <td ><strong>SMEC Code:</strong></td>
              <td ><?php echo $smec_code; ?></td>
             </tr>
             <tr>
              <td  ><strong>Project Type:</strong></td>
              <td ><?php if($ptype==1) echo "Time-Based";
			  elseif($ptype==2) echo "Milestone"; ?></td>
            </tr>
           
             <tr>
              <td ><strong>Contract Value:</strong></td>
              <td ><?php echo number_format($pcost,0); ?></td>
             </tr>
             <tr>
              <td ><strong>Sector:</strong></td>
              <td ><?php echo $sector_name; ?></td>
             </tr>
             <tr>
              <td ><strong>Country:</strong></td>
              <td ><?php echo $country_name; ?></td>
             </tr>
             <tr>
              <td ><strong>Location:</strong></td>
              <td ><?php echo $location; ?></td>
             </tr>
             
            <?php /*?><tr>
              <td ><strong>Project Currencies:</strong></td>
              <td ><table class="table table-striped"><tr><td colspan="2"><?php echo "<strong>Base Currency:</strong> ".$base_cur;?></td></tr>
              <tr><td><?php echo "<strong>Currency 1:</strong> ".$cur_1;?></td>
              <td><?php echo "<strong>Rate:</strong> ".$cur_1_rate;?></td></tr>
              <?php if($cur_2!="")
			  {?>
              <tr><td><?php echo "<strong>Currency 2:</strong> ".$cur_2;?></td>
              <td><?php echo "<strong>Rate:</strong> ".$cur_2_rate;?></td></tr>
              <?php }?>
              <?php if($cur_3!="")
			  {?>
              <tr><td><?php echo "<strong>Currency 3:</strong> ".$cur_3;?></td>
              <td><?php echo "<strong>Rate:</strong> ".$cur_3_rate;?></td></tr>
              <?php }?>
              </table></td>
             </tr><?php */?>
             </table>
             
                                </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6 d-flex align-items-stretch">
              <div class="row">
                <div class="col-md-12 grid-margin stretch-card">
                  <div class="card">
                    <div class="card-body">
                      <h4 class="card-title">Timeline</h4>
                       <table class="table table-striped">
                                   
                      <tr>
              <td ><strong>Start Date:</strong></td>
              <td ><?php echo date("d-m-Y", strtotime($pstart)); ?></td>
        </tr>
			 <tr>
              <td ><strong>End Date:</strong></td>
              <td ><?php echo date("d-m-Y", strtotime($pend)); ?></td>
             </tr>
              
             </table>
                    </div>
                  </div>
                </div>
                <div class="col-md-12 grid-margin stretch-card">
                  <div class="card">
                    <div class="card-body">
                      <h4 class="card-title">Stakeholders</h4>
                     
                      <div class="row">
                        <div class="col-md-4 d-flex align-items-center">
                          <div class="d-flex flex-row align-items-center">
                            <i class="ti-package icon-lg text-warning"></i>
                            <p class="mb-0 ms-1">
                             Client
                            </p>
                          </div>
                        </div>
                        <div class="col-md-4 d-flex align-items-center">
                          <div class="d-flex flex-row align-items-center">
                            <i class="ti-package icon-md text-success"></i>
                            <p class="mb-0 ms-1">
                            Fundding Agency
                            </p>
                          </div>
                        </div>
                        <div class="col-md-4 d-flex align-items-center">
                          <div class="d-flex flex-row align-items-center">
                            <i class="ti-package icon-sm text-danger"></i>
                            <p class="mb-0 ms-1">
                             Consultant
                            </p>
                          </div>
                        </div>
                        <table class="table table-striped">
                     
              <tr>
              <td ><strong>Client:</strong></td>
              <td ><?php echo $client; ?></td>
             </tr>
               <tr>
              <td ><strong>Consultant:</strong></td>
              <td ><?php echo $consultant; ?></td>
             </tr>
             <tr>
              <td ><strong>Funding Agency:</strong></td>
              <td ><?php echo $funding_agency; ?></td>
             </tr>
             <tr>
              <td ><strong>Contractor:</strong></td>
              <td ><?php echo $contractor; ?></td>
             </tr>
             </table>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            
          </div>
                  </div>
                  <div class="tab-pane fade show" id="logs" role="tabpanel" aria-labelledby="logs"> 
                     
                    <div class="row">
            
            <div class="col-md-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">User Logs</h4>
                 
                  <div class="template-demo">
                   <div class="chartjs-bar-wrapper mt-3">
                                
             
                                </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6 d-flex align-items-stretch">
              <div class="row">
                <div class="col-md-12 grid-margin stretch-card">
                  <div class="card">
                    <div class="card-body">
                      <h4 class="card-title">Dashbaord Logs</h4>
                       
                    </div>
                  </div>
                </div>
                <div class="col-md-12 grid-margin stretch-card">
                  <div class="card">
                    <div class="card-body">
                      <h4 class="card-title">Project Tools Logs</h4>
                     
                      <div class="row">
                        
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            
          </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        
        <!-- content-wrapper ends -->
        <!-- partial:partials/_footer.html -->
        <div id="partials-footer"></div>
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->

   <!-- Plugin js for this page -->
  <script src="vendors/chart.js/Chart.min.js"></script>
  <script src="vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
  <script src="vendors/progressbar.js/progressbar.min.js"></script>

  <!-- End plugin js for this page -->
  
  <!-- Custom js for this page-->
  <script src="js/dashboard.js"></script>
  <script src="js/Chart.roundedBarCharts.js"></script>
  <!-- <script src="js/navtype_session.js"></script> -->
  <script src="//cdn.rawgit.com/rainabba/jquery-table2excel/1.1.0/dist/jquery.table2excel.min.js"></script>
<script type="text/javascript" src="https://unpkg.com/xlsx@0.15.1/dist/xlsx.full.min.js"></script>


  <script>
      $(function(){
        $("#partials-navbar").load("partials/_navbar.php");
      });
  </script>

  <script>
    $(function(){
      $("#partials-theme-setting-wrapper").load("partials/_settings-panel.php");
    });
  </script>

  <script>
    $(function(){
      $("#partials-sidebar-offcanvas").load("partials/_sidebar.php");
    });
</script>

<script>
  $(function(){
    $("#partials-footer").load("partials/_footer.php");
  });
</script>



</body>

</html>

