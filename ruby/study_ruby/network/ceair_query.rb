#!/usr/bin/ruby -w
# coding: utf-8

require 'net/http'
require 'json'
require 'date'

class Ceair_Query
	def initialize(startDateStr, endDateStr, days, interval = 180)
		startDate = Date.parse(startDateStr)
		endDate = Date.parse(endDateStr)
		startDate.upto(endDate) do |startD|
			days.each do |t|
				endD = startD + t
				source =      {"nation"=>"US", "city"=>"SFO", "airport"=>"SFO", "date"=>"#{startD}"}
				destination = {"nation"=>"CN", "city"=>"SHA", "airport"=>"PVG", "date"=>"#{endD}"}
				puts "start on #{startD}, back on #{endD}, lowest price is #{roundTripQuery(source, destination)}"
				sleep interval
			end
		end
	end

	#source:      {"nation"=>"US", "city"=>"SFO", "airport"=>"SFO", "date"=>"2015-07-10"}
	#destination: {"nation"=>"CN", "city"=>"SHA", "airport"=>"PVG", "date"=>"2015-07-20"}
	def roundTripQuery(source, destination)
		uri = URI('http://www.ceair.com/booking/flight-search!doFlightSearch.shtml?rand=0.5678994339419968')

		searchCondTemplate = '{
		"tripType":"RT","adtCount":1,"chdCount":0,"infCount":0,"currency":"CNY","sortType":"t",
		"segmentList":	
		    [
			{
			"deptCdTxt":"@srcAirport@","deptCd":"@srcAirport@#","deptNation":"@srcNation@","deptRegion":"AM","deptCityCode":"@srcCity@",
			"arrCd":"PVG#","arrCdTxt":"PVG","arrNation":"CN","arrRegion":"CN","arrCityCode":"SHA","deptDt":"@srcDate@"
			},
			{
			"deptCdTxt":"PVG","deptCd":"PVG#","deptNation":"CN","deptRegion":"CN","deptCityCode":"SHA",
			"arrCd":"@srcAirport@#","arrCdTxt":"@srcAirport@","arrNation":"@srcNation@","arrRegion":"AM","arrCityCode":"@srcCity@","deptDt":"@dstDate@"
			}
		    ]
		}'

		{"src"=>source, "dst"=>destination}.each do |k, v|
			searchCondTemplate.gsub!("@#{k}Nation@", v["nation"])
			searchCondTemplate.gsub!("@#{k}City@", v["city"])
			searchCondTemplate.gsub!("@#{k}Airport@", v["airport"])
			searchCondTemplate.gsub!("@#{k}Date@", v["date"])
		end

		searchCond = JSON.parse(searchCondTemplate)
		searchCondFormat = searchCond.to_s.gsub("=>", ":")
		#debug: puts searchCondFormat

=begin "format of result string"
result_str = 'flightSearchResultDto =flightSearchResultDto =
{"adtNum":1,"blockPrice":0,"cabinNames":{"business":"公务舱","economy":"经济舱","first":"头等舱","lowest":"最低价","luxury":"高端舱","more":"更多优惠"},
 "chdNum":0,"currency":"CNY","infNum":0,"intervalTime":"2","isInter":true,"itemType":"1","jsonFlights":"","resultCode":"","resultMsg":"","resultType":"",
 "segType":"RT","sessionId":"2015-06-07 15:06:37.698","taxCurrency":"CNY","token":"",
 "tripItemList":[
	{"airRoutingList":[
		{"duration":"","flightList":[
			{"acfamily":"33H","airlineName":"东方航空","arrCd":"PVG","arrCity":"SHA","arrCityNm":"上海","arrDistance":"","arrNm":"浦东机场",
			 "arrTerm":"T1","arrTime":"2015-07-10 17:30","asrType":true,"carrier":"MU","codeShare":false,"deptCd":"SFO","deptCity":"SFO",
			 "deptCityNm":"旧金山","deptDay":"星期四","deptDistance":"","deptNm":"旧金山机场","deptTerm":"I","deptTime":"2015-07-09 12:00",
			 "duration":"13:30","flightNo":"MU590","goBackFlag":"1","index":0,"lingyanFlag":false,"mealType":true,"mobileType":true,"segVia":"0",
			 "shareAirlineName":"","shareCarrier":"","shareFlightNo":"","stayTime":"","taxiType":false,"trainNo":"","wifiType":false
			},
			{"acfamily":"33H","airlineName":"东方航空","arrCd":"SFO","arrCity":"SFO","arrCityNm":"旧金山","arrDistance":"","arrNm":"旧金山机场",
			 "arrTerm":"I","arrTime":"2015-07-20 09:30","asrType":true,"carrier":"MU","codeShare":false,"deptCd":"PVG","deptCity":"SHA",
			 "deptCityNm":"上海","deptDay":"星期一","deptDistance":"","deptNm":"浦东机场","deptTerm":"T1","deptTime":"2015-07-20 13:00",
			 "duration":"12:30","flightNo":"MU589","goBackFlag":"2","index":1,"lingyanFlag":false,"mealType":true,"mobileType":true,"segVia":"0",
			 "shareAirlineName":"","shareCarrier":"","shareFlightNo":"","stayTime":"235:30","taxiType":false,"trainNo":"","wifiType":false
			}],
		 "index":0,"loadFlag":true,"priceDisp":{"business":"21520","economy":"7400","first":"","lowest":"7400","more":""},
		 "priceIcons":{"business":"","economy":"","first":"","lowest":"","more":""},
		 "productInfoList":[{"addServiceList":[],"baggageWeight":"2PC","baseCabin":"business","cabinCode":"I/I","cabinLeft":"A","comment":"改期费CNY800",
				     "index":0,"minFlag":false,"minStay":"","price":"21520","priceAmountAdt":"21520","priceAmountChd":"21520","priceAmountInf":"0",
				     "productCd":"SOTO_RT_C_DIS","productDetail":"","productDetailList":[
						{"cabinCode":"I","cabinLeft":"A","comment":"","index":0,"minStay":"","ruleForm":null,"trainBaseCabin":""},
						{"cabinCode":"I","cabinLeft":"A","comment":"","index":1,"minStay":"","ruleForm":null,"trainBaseCabin":""}
						],
				     "productNm":"公务舱折扣","productType":"INTER_COMMON","rewardPoint":"0.0","taxview":{"amount":0,"taxInfoList":[]}
				    },
				    {"addServiceList":[],"baggageWeight":"2PC","baseCabin":"economy","cabinCode":"V/H","cabinLeft":"A","comment":"改期费CNY800",
				     "index":1,"minFlag":true,"minStay":"6D","price":"7400","priceAmountAdt":"7400","priceAmountChd":"5890","priceAmountInf":"0",
				     "productCd":"SOTO_RT_Y_DIS","productDetail":"","productDetailList":[
						{"cabinCode":"V","cabinLeft":"A","comment":"","index":0,"minStay":"6D","ruleForm":null,"trainBaseCabin":""},
						{"cabinCode":"H","cabinLeft":"A","comment":"","index":1,"minStay":"6D","ruleForm":null,"trainBaseCabin":""}
						],
				     "productNm":"经济舱折扣","productType":"INTER_COMMON","rewardPoint":"0.0","taxview":{"amount":0,"taxInfoList":[]}
				    }
				   ],
		 "stayTime":"235:30"
		}],
	 "arrCd":"PVG","arrCity":"SHA","arrCityNm":"上海","arrDate":"星期五","arrNm":"浦东机场","arrRegion":"CN",
	 "backArrCd":"SFO","backArrCity":"SFO","backArrCityNm":"旧金山","backArrDate":"","backArrNm":"旧金山机场","backDeptCd":"PVG","backDeptCity":"SHA",
	 "backDeptCityNm":"上海","backDeptDate":"2015-07-20","backDeptNm":"浦东机场","deptCd":"SFO","deptCity":"SFO","deptCityNm":"旧金山","deptDate":"2015-07-09",
	 "deptDay":"星期四","deptNm":"旧金山机场","deptRegion":"AM","index":0,"lowPriceList":["3420","2930","3420","2930","3420","3420","3420"],
	 "lowPricebyProType":[],"optionList":[]
	}],
 "validateFlightInfo":[]
}'
=end
		res = Net::HTTP.post_form(uri, 'searchCond' => searchCondFormat)
		result_str = res.body.to_s
		result_str.gsub!("flightSearchResultDto =", " ")
		result_str.gsub!("[]", "\"\"")
		#debug: puts result_str
		result = JSON.parse(result_str)
		begin
			result["tripItemList"][0]["airRoutingList"][0]["priceDisp"]["economy"]
		rescue
			puts result
			"NoPrice"
		end
	end
end

Ceair_Query.new("2015-07-09", "2015-07-11", [10, 11])
