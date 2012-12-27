module AssociatesHelper
	def total_associates
		associate_cnt = Associate.count
		return number_with_delimiter(associate_cnt, :delimiter => ",")
	end
end
