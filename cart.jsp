<!doctype html>
<html class="no-js" lang="zxx">
<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>Shopping Cart</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Favicons -->
	<link rel="shortcut icon" href="images/favicon.ico">
	<link rel="apple-touch-icon" href="images/icon.png">

	<!-- Google font (font-family: 'Roboto', sans-serif; Poppins ; Satisfy) -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet"> 
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,300i,400,400i,500,600,600i,700,700i,800" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">

	<!-- Stylesheets -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/plugins.css">
	<link rel="stylesheet" href="css/style.css">

	<!-- Cusom css -->
   <link rel="stylesheet" href="css/custom.css">

	<!-- Modernizer js -->
	<script src="js/vendor/modernizr-3.5.0.min.js"></script>

	<!--	Font awesome-->
	<script src="https://kit.fontawesome.com/c25baca2b9.js" crossorigin="anonymous"></script>
</head>
<body>
	<!--[if lte IE 9]>
		<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
	<![endif]-->

	<!-- Main wrapper -->
	<div class="wrapper" id="wrapper">
		
		<!-- Header -->
		<jsp:include page="header.jsp"></jsp:include>
		<!-- //Header -->
		<!-- Start Search Popup -->
		<div class="box-search-content search_active block-bg close__top">
			<form id="search_mini_form" class="minisearch" action="#">
				<div class="field__search">
					<input type="text" placeholder="Tìm kiếm tựa sách...">
					<div class="action">
						<a href="#"><i class="zmdi zmdi-search"></i></a>
					</div>
				</div>
			</form>
			<div class="close__wrap">
				<span>close</span>
			</div>
		</div>
		<!-- End Search Popup -->
        <!-- Start Bradcaump area -->
        <div class="ht__bradcaump__area ">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="bradcaump__inner text-center">
                            <nav class="bradcaump-content">
                              <a class="breadcrumb_item" href="index.jsp">Trang chủ</a>
                              <span class="brd-separetor">/</span>
                              <span class="breadcrumb_item active">Giỏ hàng</span>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Bradcaump area -->
        <!-- cart-main-area start -->
        <div class="cart-main-area section-padding--lg bg--white">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-sm-12 ol-lg-12">
                        <form action="#">               
                            <div class="table-content wnro__table table-responsive">
                                <table>
                                    <thead>
                                        <tr class="title-top">
                                            <th class="product-thumbnail">Hình ảnh</th>
                                            <th class="product-name">Tên sản phẩm</th>
                                            <th class="product-price">Giá tiền</th>
                                            <th class="product-quantity">Số lượng</th>
                                            <th class="product-subtotal">Tổng cộng</th>
                                            <th class="product-remove">Xóa</th>
                                        </tr>
                                    </thead>
                                    <% Cart c = (Cart) request.getAttribute("Cart");
                                    if(c ==null)c= new Cart();
                                    for(Product p:c.list())
                                    {
                                    %>
                                    <tbody>
                                            <tr>
                                            <td class="product-thumbnail"><a href="#"><img
													src="<%=p.getImg()%>" height="150"
													width="150"/></a></td>
                                            <td class="product-name"><a href="#"><%=p.getName()%></a></td>
                                            <td class="product-price"><span class="amount"><%=p.getPrice()%> ₫</span></td>
                                            <td class="product-quantity">
                                                <form method="post" action="<%=Util.fullPath("CartUpdate")%>">
                                                    <input type="hidden" name="id" value="<%=p.getId()%>">
                                                    <input type="number" name="quatity" value="<%=p.getQuatity()%>">
                                                    <input type="submit"value="▲" title="Update" class="capnha">
                                                </form>
                                            </td>

                                            <td class="product-subtotal"><%=p.total()%> ₫</td>
                                            <td class="product-remove"><a href="<%=Util.fullPath("DelProduct?id="+p.getId())%>"><i title="Xoá" class="fas fa-trash fa-1x" ></i></a></td>
                                        </tr>

                                    <% } %>
                                    </tbody>
                                </table>
                            </div>
                        </form>
                        <div class="cartbox__btn">
                            <ul class="cart__btn__list d-flex flex-wrap1 flex-md-nowrap1 flex-lg-nowrap1 justify-content-between1">

<!--                                <li><a href="#">Apply Code</a></li>-->
                                <li><a  href="#">Cập nhập</a></li>
                                <li><a class="tt"  href="checkout.jsp">Thanh toán</a></li>
								<div class="cv">
								<li ><a href="#">Mã giảm giá</a></li>

								</div>
								<div class="gg"><input class="gg1" type="text" placeholder="Nhập mã giảm giá..."></div>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6 offset-lg-6">
                        <div class="cartbox__total__area">
                            <div class="cart__total__amount">
                                <span>Tổng tiền</span>
                                <span><%=c.total()%> ₫</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>  
        </div>
        <!-- cart-main-area end -->
		<!-- Footer Area -->
		<jsp:include page="footer.jsp"></jsp:include>
		<!-- //Footer Area -->

	</div>
	<!-- //Main wrapper -->

	<!-- JS Files -->
	<script src="js/vendor/jquery-3.2.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/plugins.js"></script>
	<script src="js/active.js"></script>
	
</body>
</html>
