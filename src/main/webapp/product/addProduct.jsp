<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<meta charset="UTF-8"><base>
	<title>상품추가</title>
	</head>
	<body>
		<jsp:include page="../inc/menu.jsp"/>
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3">상품등록</h1>
			</div>
		</div>
		<form name="frmProduct" action="./processAddProduct.jsp" method="post" enctype="multipart/form-data">
		<div class="container">
				<div class="form-group row" >
					<label class="col-sm-2">상품 아이디</label>
					<div class="col-md-3">
				 	<input type="text" name="productId" class="form-control">
					</div>
				</div>
		</div>
		<div class="container">
				<div class="form-group row" >
					<label class="col-sm-2">상품명</label>
					<div class="col-md-3">
				 	<input type="text" name="productName" class="form-control">
					</div>
				</div>
		</div>
		<div class="container">
				<div class="form-group row" >
					<label class="col-sm-2">상품 가격</label>
					<div class="col-md-3">
				 	<input type="text" name="unitPrice" class="form-control">
					</div>
				</div>
		</div>
		<div class="container">
				<div class="form-group row" >
					<label class="col-sm-2">상품 설명</label>
					<div class="col-md-3">
				 	<input type="text" name="description" class="form-control">
					</div>
				</div>
		</div>
		<div class="container">
				<div class="form-group row" >
					<label class="col-sm-2">제조사</label>
					<div class="col-md-3">
				 	<input type="text" name="manufacturer" class="form-control">
					</div>
				</div>
		</div>
		<div class="container">
				<div class="form-group row" >
					<label class="col-sm-2">분류</label>
					<div class="col-md-3">
				 	<input type="text" name="category" class="form-control">
					</div>
				</div>
		</div>
		<div class="container">
				<div class="form-group row" >
					<label class="col-sm-2">재고수</label>
					<div class="col-md-3">
				 	<input type="text" name="unitInStock" class="form-control">
					</div>
				</div>
		</div>
		<div class="container">
				<div class="form-group row" >
					<label class="col-sm-2">상태</label>
					<div class="col-md-3">
				 	<input type="radio" name="condition" value="New"> 신규 제품
				 	<input type="radio" name="condition" value="Old"> 중고 제품
				 	<input type="radio" name="condition" value="Refurbished"> 재생 제품
					</div>
				</div>
		</div>
		<div class="container">
				<div class="form-group row" >
					<label class="col-sm-2">이미지</label>
					<div class="col-md-3">
				 	<input type="file" name="fileName" class="form-control">
					</div>
				</div>
		</div>
		<div class="container">
				<div class="form-group row">
					<div class="col-sm-10">
						<input type="submit" class="btn btn-primary" value="등록">
					</div>
				</div>	
		</div>
		</form>
		<jsp:include page="../inc/footer.jsp"/>
	</body>
</html>