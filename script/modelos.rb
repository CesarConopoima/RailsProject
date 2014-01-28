# Encoding: utf-8
@hash={}
Dir.glob("../app/assets/images/*/*/*").each {|i|
	id=i.split("/").last.split(".").first.to_s
	@marca=i.split("/")[-2]
	@hash[:"#{id}"]=@marca
	puts i
}
puts @hash
bdNew=File.new("../db/seeds_2.rb","w")
bd=File.open("../db/seeds.rb","r")
@k=0
bd.each {|line|
	@code=line.split(",")[1].to_s.split("-")[1].to_s.split("X")[0].to_s.gsub("'","")
	@model=line.split(",").last.to_s.split(":").last.to_s.gsub("'","").to_s.gsub(")","").split(" ")[0].to_s
	@marca=line.split(",")[2].to_s.split(":").last.to_s.gsub("'","") +"_"+line.split(",").first.to_s.split(":").last.to_s.split(" ").first.to_s.downcase.capitalize.gsub("'","")
	@hash.each{|k,v|
		k.to_s.split("_").each{|key|
		if (@code.include?("#{key}") or @model.include?("#{key}")) and @marca==v
			p "#{key}"+"  _#{@code}"+"  _#{@model}"+"     #{v}"
			value=v.to_s.split("_")[1]
			line=line.gsub("imageUrl:'logo/no_dispo.jpg'","imageUrl:'#{value}/#{v}/#{k}.jpg'")
			@k+=1	
		end
		}
	}
	bdNew.puts line
}
puts @k
#puts @hash.count
