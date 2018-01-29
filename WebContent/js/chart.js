$(function () {
	var mandata = $("#manData").val();
	var womandata = $("#womanData").val();
	var man = eval(mandata);
	var woman = eval(womandata);
	$('#genderpie').highcharts({
			chart: {
				plotBackgroundColor: null,
				plotBorderWidth: null,
				plotShadow: false
			},
			title: {
				text: ''
			},
			tooltip: {
				pointFormat: '<b>{point.percentage:.1f}%</b>',
				style: {
					fontFamily: "微软雅黑",
					fontSize: '15px',
				}
			},
			colors:[
				'#f28f43', //橘黄
				'#1aadce',//天空蓝
				//'#492970',//紫色
				//'#77a1e5', //浅蓝
				//'#c42525', //暗红
				//'#a6c96a'//暗绿
			],
		
			plotOptions: {
				pie: {
					allowPointSelect: true,
					cursor: 'pointer',
					dataLabels: {
                        enabled: false
                    },
                    showInLegend: true
				}
			},
			series: [{
				type: 'pie',
				data: [
					['女性',  woman],
					{
						name: '男性',
						y: man,
						sliced: true,
						selected: true
					}
				]
			}]
		});
	});
	
	$(function () {
		var teens = eval($("#Data10").val());
		var twenties = eval($("#Data20").val());
		var thirties = eval($("#Data30").val());
		var forties = eval($("#Data40").val());
		var fifties = eval($("#Data50").val());
		var elderly = eval($("#Data60").val());
        categories = ['10~20岁', '20~30岁', '30~40岁', '40~50岁', '50~60岁','60岁以上'],
		name = '年龄分布柱状图',
		colors = [
				'#f28f43', //橘黄
				'#1aadce',//天空蓝
				'#492970',//紫色
				'#77a1e5', //浅蓝
				'#c42525', //暗红
				'#a6c96a'//暗绿
			],
        data = [{
                y: teens,
                color: colors[0],
            }, {
                y: twenties,
                color: colors[1],
            }, {
                y: thirties,
                color: colors[2],
            }, {
                y: forties,
                color: colors[3],
            }, {
                y: fifties,
                color: colors[4],
            },{
            	y: elderly,
            	color: colors[5],
    		}];

		function setChart(name,categories, data, color) {
			chart.xAxis[0].setCategories(categories, false);
			chart.series[0].remove(false);
			chart.addSeries({
				name: name,
				data: data,
				color: color || 'white'
			}, false);
			chart.redraw();
		}

		var chart = $('#ageColumn-drilldown').highcharts({
			chart: {
				type: 'column'
			},
			title: {
				text: ''
			},
			subtitle: {
				text: ''
			},
			xAxis: {
				categories: categories
			},
			yAxis: {
				title: {
					text: ''
				}
			},
			plotOptions: {
				column: {
					cursor: 'pointer',
					dataLabels: {
						enabled: true,
						color: colors[0],
						style: {
							fontFamily: "微软雅黑",
							fontSize: '15px',
						},
						formatter: function() {
							return this.y +'%';
						}
					}
				}
			},
			tooltip: {
				style: {
						fontFamily: "微软雅黑",
						fontSize: '15px'
				},
				formatter: function() {
					var point = this.point,
						s = this.x +':'+ '<b>'+this.y +'%</b>';
					return s;
				}
			},
			series: [{
				name: name,
				data: data,
				color: 'white'
			}],
			exporting: {
				enabled: true
			}
		})
		.highcharts(); // return chart
	});
	
	$(function () {
		var consumeDate = eval($("#consumeDateData").val());
		var consume = eval($("#consumeData").val());
		//alert(consumeDate[0]);
		$('#consume').highcharts({
			title: {
				text: '近30天会员总消费金额曲线图',
				style: {
					fontWeight: 'bold'
				},
				x: -20 //center
			},
			subtitle: {
				text: '',
				x: -20
			},
			xAxis: {
				categories: consumeDate,
				labels: {
	                rotation: -45 //坐标刻度垂直显示
	            }
			},
			yAxis: {
				title: {
					text: '总金额 (￥)',
					style: {
						fontSize: '18px',
						fontWeight: 'bold'
					}
				},
				plotLines: [{
					value: 0,
					width: 1,
					color: '#808080',
				}]
			},
			tooltip: {
				style: {
						fontFamily: "微软雅黑",
						fontSize: '15px'
				},
				valueSuffix: '￥'
			},
			series: [{
				name: '每日消费总量',
				data: consume
			}]
		});
	});
	
	$(function () {
		var diamond = eval($("#diamondData").val());
		var gold = eval($("#goldData").val());
		var silver = eval($("#silverData").val());
		$('#vipTypePie').highcharts({
			chart: {
				type: 'pie',
				options3d: {
					enabled: true,
					alpha: 45,
					beta: 0
				}
			},
			title: {
				text: ''
			},
			tooltip: {
				pointFormat: '<b>{point.percentage:.1f}%</b>',
				style: {
					fontFamily: "微软雅黑",
					fontSize: '15px'
				}
			},
			colors:[
				'#f28f43', //橘黄
				'#1aadce',//天空蓝
				//'#492970',//紫色
				//'#77a1e5', //浅蓝
				//'#c42525', //暗红
				'#a6c96a'//暗绿
			],
		
			plotOptions: {
				pie: {
					allowPointSelect: true,
					cursor: 'pointer',
					depth: 35,
					dataLabels: {
                        enabled: false
                    },
                    showInLegend: true
				}
			},
			series: [{
				type: 'pie',
				data: [
					['金卡',   gold],
					{
						name: '钻石卡',
						y: diamond,
						sliced: true,
						selected: true
					},
					['银卡' , silver]
				]
			}]
		});
	});
	
	$(function () {
		var valid = eval($("#validData").val());
		var cancel = eval($("#cancelData").val());
		var pause = eval($("#pauseData").val());
		var stop = eval($("#stopData").val());
		$('#vipConditionPie').highcharts({
			chart: {
				type: 'pie',
				options3d: {
					enabled: true,
					alpha: 45,
					beta: 0
				}
			},
			colors:[
				'#f28f43', //橘黄
				'#1aadce',//天空蓝
				'#492970',//紫色
				//'#77a1e5', //浅蓝
				//'#c42525', //暗红
				'#a6c96a'//暗绿
			],
			title: {
				text: ''
			},
			tooltip: {
				pointFormat: '<b>{point.percentage:.1f}%</b>',
				style: {
						fontFamily: "微软雅黑",
						fontSize: '15px'
					}
			},
			plotOptions: {
				pie: {
					allowPointSelect: true,
					cursor: 'pointer',
					depth: 35,
					dataLabels: {
						enabled: false
					},
					showInLegend: true
				}
			},
			series: [{
				type: 'pie',
				data: [
					['暂停',   pause],
					['取消',   cancel],
					{
						name: '有效',
						y: valid,
						sliced: true,
						selected: true
					},
					['停止',    stop]
				]
			}]
		});
	});
	
	$(function () {
		var totalDate = eval($("#totalDateData").val());
		var total = eval($("#totalData").val());
		$('#totalNum').highcharts({
			title: {
				text: '近30天每日总人数曲线图',
				style: {
					fontWeight: 'bold'
				},
				x: -20 //center
			},

			xAxis: {
				categories: totalDate,
				labels: {
					rotation: -45 //坐标刻度垂直显示
				}
			},
			yAxis: {
				title: {
					text: '总人数',
					style: {
						fontSize: '18px',
						fontWeight: 'bold'
					}
				},
				plotLines: [{
					value: 0,
					width: 1,
					color: '#808080'
				}]
			},
			
			tooltip: {
				style: {
						fontFamily: "微软雅黑",
						fontSize: '15px'
				}
			},
			series: [{
				name: '每日总人数',
				data: total
			}]
		});
	});
	
	$(function () {
		var hallDate = eval($("#hallDateData").val());
		var hall1 = eval($("#hall1Data").val());
		var hall2 = eval($("#hall2Data").val());
		var hall3 = eval($("#hall3Data").val());
		var hall4 = eval($("#hall4Data").val());
		var hall5 = eval($("#hall5Data").val());
		$('#hall').highcharts({
			title: {
				text: '近一周各影厅上座率曲线图',
				style: {
					fontWeight: 'bold'
				},
				x: -20 //center
			},
			xAxis: {
				categories: hallDate
			},
			yAxis: {
				title: {
					text: '上座率',
					style: {
						fontSize: '18px',
						fontWeight: 'bold'
					}
				},
				plotLines: [{
					value: 0,
					width: 1,
					color: '#808080'
				}]
			},
			colors:[
				'#f28f43', //橘黄
				'#1aadce',//天空蓝
				'#492970',//紫色
				//'#77a1e5', //浅蓝
				'#c42525', //暗红
				'#a6c96a'//暗绿
			],
			tooltip: {
				style: {
						fontFamily: "微软雅黑",
						fontSize: '15px'
				},
				valueSuffix: '%'
			},
			legend: {
				layout: 'vertical',
				align: 'right',
				verticalAlign: 'middle',
				borderWidth: 0
			},
			series: [{
				name: '1号厅',
				data: hall1
			}, {
				name: '2号厅',
				data: hall2
			}, {
				name: '3号厅',
				data: hall3
			}, {
				name: '4号厅',
				data: hall4
			}, {
				name: '5号厅',
				data: hall5
			}]
		});
	});
	
	$(function () {
		var movieDate = eval($("#movieDateData").val());
		var movie1 = eval($("#movie1Data").val());
		var movie2 = eval($("#movie2Data").val());
		var movie3 = eval($("#movie3Data").val());
		var movie4 = eval($("#movie4Data").val());
		var movie5 = eval($("#movie5Data").val());
		$('#movie').highcharts({
			title: {
				text: '近一周各影片上座率曲线图',
				style: {
					fontWeight: 'bold'
				},
				x: -20 //center
			},
			xAxis: {
				categories: movieDate
			},
			yAxis: {
				title: {
					text: '上座率',
					style: {
						fontSize: '18px',
						fontWeight: 'bold'
					}
				},
				plotLines: [{
					value: 0,
					width: 1,
					color: '#808080'
				}]
			},
			colors:[
				'#f28f43', //橘黄
				'#1aadce',//天空蓝
				'#492970',//紫色
				//'#77a1e5', //浅蓝
				'#c42525', //暗红
				'#a6c96a'//暗绿
			],
			tooltip: {
				style: {
						fontFamily: "微软雅黑",
						fontSize: '15px'
				},
				valueSuffix: '%'
			},
			legend: {
				layout: 'vertical',
				align: 'right',
				verticalAlign: 'middle',
				borderWidth: 0
			},
			series: [{
				name: '天将雄狮',
				data: movie1
			}, {
				name: '澳门风云2',
				data: movie2
			}, {
				name: '狼图腾',
				data: movie3
			}, {
				name: '冲上云霄',
				data: movie4
			}, {
				name: '钟馗伏魔',
				data: movie5
			}]
		});
	});
	
	$(function () {
		var card = eval($("#cardData").val());
		var cash = eval($("#cashData").val());
		$('#buypie').highcharts({
			chart: {
				plotBackgroundColor: null,
				plotBorderWidth: null,
				plotShadow: false
			},
			title: {
				text: ''
			},
			tooltip: {
				pointFormat: '<b>{point.percentage:.1f}%</b>',
				style: {
					fontFamily: "微软雅黑",
					fontSize: '15px',
				}
			},
			colors:[
				//'#f28f43', //橘黄
				'#1aadce',//天空蓝
				//'#492970',//紫色
				//'#77a1e5', //浅蓝
				//'#c42525', //暗红
				'#a6c96a'//暗绿
			],
		
			plotOptions: {
				pie: {
					allowPointSelect: true,
					cursor: 'pointer',
					dataLabels: {
                        enabled: false
                    },
                    showInLegend: true
				}
			},
			series: [{
				type: 'pie',
				data: [
					['现金',   cash],
					{
						name: '会员卡',
						y: card,
						sliced: true,
						selected: true
					}
				]
			}]
		});
	});