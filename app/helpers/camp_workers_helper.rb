module CampWorkersHelper
	
	def get_department_name(n)
		if n == 1
			return "行政"
		elsif n == 2
			return "活動"
		elsif n == 3
			return "生活"
		elsif n == 4
			return "場器"
		elsif n == 5
			return "美宣"
		elsif n == 6
			return "公關"
		elsif n == 7
			return "課程"
		else 
			return "其他"
	
		end
	
	end


end
