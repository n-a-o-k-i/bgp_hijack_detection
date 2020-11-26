fullroute_arry = []
update_arry = []
count = 0
start_time = Time.now

File.open("fullroute.txt"){|f|
	f.each_line do |line|
    fullroute_arry.push(line)
  end
}

File.open("update.txt"){|f|
	f.each_line do |line|
    update_arry.push(line)
  end
}

fullroute_arry.each do |fullroute|
	fullroute_network = fullroute.match(/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\/\d{1,2}/)
	fullroute_prefix = fullroute_network[0].slice(-3, 3)
	fullroute_address = fullroute_network[0].sub(fullroute_prefix,'')

	update_arry.each do |update|
		update_network = update.match(/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\/\d{1,2}/)
		update_prefix = update_network[0].slice(-3, 3)
		update_address = update_network[0].sub(update_prefix,'')

		p "fullroute_network: #{fullroute_network}"
		p "fullroute_prefix: #{fullroute_prefix}"
		p "fullroute_address: #{fullroute_address}"

		p "update_network: #{update_network}"
		p "update_prefix: #{update_prefix}"
		p "update_address: #{update_address}"
	
		if fullroute_address == update_address
			if fullroute_prefix > update_prefix
				p "fullroute: #{fullroute_arry[0]}"
				p "update: #{update_arry[0]}"
				p "ハイジャックされてない"
			else
				p "fullroute: #{fullroute_arry[0]}"
				p "update: #{update_arry[0]}"
				p "ハイジャックされてる"
			end
		end
		
		count += 1
		p "ループ総数: #{count}"
		p "処理速度: #{Time.now - start_time}s"
	end
end