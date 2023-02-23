def decipher(name)
	abc = ('a'..'z').to_a
	name.split('').map do |char|
		char = char.downcase
		if abc.include?(char)
			char_index = abc.index(char)
			new_char = abc[(char_index + 13) % 26]
		else
			new_char = char
		end
		new_char
	end
end


puts decipher('Nqn Ybirynpr')
#Tenpr Ubccre
#Nqryr Tbyqfgvar
#Nyna Ghevat
#Puneyrf Onoontr
#Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
#Wbua Ngnanfbss
#Ybvf Unvog
#Pynhqr Funaaba
#Fgrir Wbof
#Ovyy Tngrf
#Gvz Orearef-Yrr
#Fgrir Jbmavnx
#Xbaenq Mhfr
#Fve Nagbal Ubner
#Zneiva Zvafxl
#Lhxvuveb Zngfhzbgb
#Unllvz Fybavzfxv
#Tregehqr Oynapu