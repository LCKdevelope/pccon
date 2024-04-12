<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
</head>
<body>
	<div style="width: 1500px;">
		<div style="display: flex; height: 50%;">
			<div style="width: 50%">
				<input id="date1" type="date">
				<div>
					<button type="button" onclick="getChartList('주문횟수','1')">매출확인하기/주문횟수</button>
					<button type="button" onclick="getChartList('매출액','1')">매출확인하기/매출액</button>
				</div>
				<div id="chartArea1">
					<canvas id="myChart1"></canvas>
				</div>
				<div id="sum1"></div>
			</div>
			<div style="width: 50%">
				<input id="date2" type="month">
				<div>
					<button type="button" onclick="getChartList_month('주문횟수','2')">매출확인하기/주문횟수</button>
					<button type="button" onclick="getChartList_month('매출액','2')">매출확인하기/매출액</button>
				</div>
				<div id="chartArea2">
					<canvas id="myChart2"></canvas>
				</div>
				<div id="sum2"></div>
			</div>
		</div>
		<div style="display: flex; height: 50%;">
			<div style="width: 50%">
				<div>
					<label for="product_category">카테고리:</label> <select id="prCategory"
						name="prCategory">
						<option value="noodle">라면</option>
						<option value="drink">음료</option>
						<option value="rice">밥</option>
						<option value="snackBar">분식</option>
						<option value="etc">기타</option>
						<option value="time">시간</option>

					</select> <input id="date3" type="month">
				</div>
				<button type="button" class="menuCategory"
					onclick="getChartList_category('주문횟수','3')">주문횟수</button>
				<button type="button" class="menuCategory"
					onclick="getChartList_category('매출액','3')">매출액</button>



				<div id="chartArea3">
					<canvas id="myChart3"></canvas>
				</div>
				<div id="sum3"></div>
			</div>



			<div style="width: 50%">
				<div>
					<select id="memAge" name="memAge">
						<option value="10">10대</option>
						<option value="20">20대</option>
						<option value="30">30대</option>
						<option value="40">40대이상</option>
					</select>
				</div>

				<div>
					<button type="button" onclick="getChartList_age('주문횟수','4')">나이별/주문횟수</button>
					<button type="button" onclick="getChartList_age('매출액','4')">나이별/매출액</button>
				</div>
				<div id="chartArea4">
					<canvas id="myChart4"></canvas>
				</div>
				<div id="sum4"></div>
			</div>
		</div>

	</div>


</body>
<!-- J쿼리-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript">
const thispcrCode='${pcrCode}';
const categoryList_gson=${categoryList_gson};

	function getChartList_age(type,num) {
		console.log(num)
		console.log(type)
		let age =document.getElementById('memAge').value
		let list;
		$.ajax({ 
			type : 'post',
			url : 'getChartList_age',
			data: {'pcrCode':thispcrCode,'age':age},
			async:false,
			dataType : 'json',
			success : function(res){
				list= res;
				
			}
			
		});
		chart(list,type,num);

		
	}

	function getChartList_category(type,num) {
		let optionObj = document.getElementById('prCategory')
		let month=document.getElementById('date'+num).value;
		console.log(optionObj.value)
		console.log(type)
		console.log(num)
		let list;
		$.ajax({ 
			type : 'post',
			url : 'getChartList_category',
			data: {'pcrCode':thispcrCode,'prCategory':optionObj.value,'month':month},
			async:false,
			dataType : 'json',
			success : function(res){
				list= res;
				
			}
			
		});
		chart(list,type,num);
	}


	function getChartList(type,num) {
		let date=document.getElementById('date'+num).value;
		console.log(date)
		let list
		$.ajax({ 
			type : 'post',
			url : 'getChartList',
			data: {'pcrCode':thispcrCode,'date':date},
			async:false,
			dataType : 'json',
			success : function(res){
				list= res;
				
			}
			
		});
		chart(list,type,num);
		
		
	}
	function getChartList_month(type,num) {
		let month=document.getElementById('date'+num).value;
		console.log(month)
		
		let list;
			$.ajax({ 
				type : 'post',
				url : 'getChartList_month',
				data: {'pcrCode':thispcrCode,'month':month},
				async:false,
				dataType : 'json',
				success : function(res){
					list= res;
					
				}
				
			});
		chart(list,type,num);
			
	}
		
	

</script>


<script>



function chart(list,category,num){

	const chartArea = document.getElementById('chartArea'+num);
	const sumArea = document.getElementById('sum'+num);
	

	let ctx = document.getElementById('myChart'+num);
	ctx.remove();
	
	let ctx1=document.createElement('canvas');
	ctx1.setAttribute('id','myChart'+num);
	
	chartArea.appendChild(ctx1)
	
	
	let saleslist=list;
		  
	var prNameList = new Array();
	var totalPriceList= new Array();
	var totalCountList = new Array();
	let idx=0;
	for(let dto of saleslist){
		console.log(dto)
		
		prNameList[idx]=dto.PRNAME
		totalPriceList[idx]=dto.TOTALPRICE
		totalCountList[idx]=dto.TOTALCOUNT
		idx++;
	}
	
	let sum=0;
	for(let val of totalPriceList){
		sum+=val;
	}
	console.log(sum)
	var viewdatalist;
	if(category=='매출액'){
		viewdatalist=totalPriceList;
	}else if((category=='주문횟수')){
		viewdatalist=totalCountList;
	}
	
	new Chart(ctx1, {
		type : 'doughnut',
		data : {
			labels :  prNameList ,
			datasets : [ {
				label : '매출현황',
				data :  viewdatalist,
				borderWidth : 1
			} ]
		},
		options : {
			scales : {
				y : {
					beginAtZero : true
				}
			}
		}
	});
	sumArea.innerText ="매출합계 :"+sum+"원"
}
</script>
</html>