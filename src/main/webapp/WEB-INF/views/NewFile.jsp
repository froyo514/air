<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

class Rectangle{
	constructor(height,width){
		this.height =height;
		this.width = width;
	}
	//Getter
	
	get area(){
		return this.calcArea();
	}
	calcArea()
		return this.height * this.width;
	}
}
const square = new Rectangle(10,10);
console.log(square.area);


</script>
</head>
<body>

</body>
</html>