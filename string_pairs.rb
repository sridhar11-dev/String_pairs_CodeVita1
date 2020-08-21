# input=[1,2,3,4,5]
input=[7,4,2]
textualform=[]
vowel=[]
char=""
finalform = ""
s=0
res=""

hsh1={"0" => "", "1" => "one", "2" => "two", "3" => "three", "4" => "four", "5" =>"five", "6" => "six", "7" => "seven", "8" =>"eight", "9" => "nine", "10" => "ten", "100" => "hundred"}
hsh2={"11" => "eleven", "12" => "twelve", "13" => "thirteen", "14" => "fourteen", "15" => "fifteen", "16" => "sixteen", "17" => "seventeen", "18" => "eighteen", "19" => "nineteen"}
hsh3={"2" => "twenty", "3" => "thirty", "4" => "fourty", "5" => "fifty", "6" => "sixty", "7" => "seventy", "8" => "eighty", "9" => "ninety"}

input.each do |num|
	char = num.to_s
	if (char == "11" || char == "12" || char == "13" || char == "14" || char == "15" || char == "16" || char == "17" || char == "18" || char == "19")
		textualform.append(hsh2[num])
	elsif ((char.length == 2) and (char != "10"))
		first = char[0]
		second = char[1]
		finalform = hsh3[first]+" "+hsh1[second]
		textualform.append(finalform) 
	else
		textualform.append(hsh1[char])
	end
end

# print textualform

def count_vowel(word)
	count=[]
	n=0
	word.each_char do |char|
		if (char == "a" || char == "e" || char == "i" || char == "o" || char == "u")
			n+=1
		end
	end
	count.append(n)
	return count
end


def unord_pairs(a,sum)
	# hsh=Hash.new
	# c=0
	# a.each do |num|
	# 	hsh[num]=a.count(num)
	# end
	# a.each do |num|
	# 	if(hsh[sum-num])
	# 		c+=hsh[sum-num]
	# 	end
	# 	if((sum-num) == num)
	# 		c-=1
	# 	end
	# end
	# return c/2

	c=0
	for i in (0...a.length)
		for j in (i+1...a.length)
			if (a[i]+a[j]== sum)
				c+=1
			end
		end
	end
	return c

end


def res(k,hsh1,hsh2,hsh3)
	f = ""
	s = ""
	final = ""
	if (k == "0")
		return "zero"
	elsif (k == "11" || k == "12" || k == "13" || k == "14" || k == "15" || k == "16" || k == "17" || k == "18" || k == "19")
		return hsh2[k]
	elsif (k.length == 2 and (k != "10"))
		f = k[0]
		s= k[1]
		final = hsh3[f]+" "+hsh1[s]
		return final
	else
		return hsh1[k]
	end
end
		

textualform.each do |word|
	vowel.append(count_vowel(word))
end

# print vowel

s = vowel.flatten!.sum

# print s

output=unord_pairs(input,s).to_s

print res(output,hsh1,hsh2,hsh3)

# if(output=="0")
# 	print "zero"
# else
# 	print hsh1[output]
# end

