# StringExt
String extensions for Swift. If you do a lot of work with strings, this might help speed things up for you.

####Usage Examples:

	var str = "This is a test, this is just a test."
	var str2 = "This%20is%20a%20test,%20this%20is%20just%20a%20test."
	var str3 = "   This is a test, this is just a test.   "
	var str4 = "1.8"
	
	str["is"] 						// 2
	str[-3] 						// s
	str.substrTo(4)					// This
	str["T", "just"]				// his is a test, this is 
	str.reverse.split(" ") 			// ".tset", "a", "tsuj", "si", "siht", ",tset", "a", "si", "sihT"
	str.split(" ")					// "This", "is", "a", "test,", "this", "is", "just", "a", "test."
	str[5, 7]						// is
	str.padding(direction: "left", repetition: 5, with: "z") // zzzzzzThis is a test, this is just a test.
	str.padding(direction: "right", repetition: 5, with: "z") // This is a test, this is just a test.zzzzzz
	str.padding(direction: "both", repetition: 5, with: "z") // zzzzzzThis is a test, this is just a test.zzzzzz
	str.startswith("This")			// true
	str.endswith("test.")			// true
	str.uppercase					// THIS IS A TEST, THIS IS JUST A TEST.
	str.exists("just")				// true
	str.replace(target: "just", with: "really just") // This is a test, this is really just a test.
	str.left(4)						// This
	str.right(1)					// .
	str.uppercase.isuppercase		// true
	str.swapcase					// tHIS IS A TEST, THIS IS JUST A TEST.
	str.occurences(" is ")			// 2
	
	str.htmlescape					// This%20is%20a%20test,%20this%20is%20just%20a%20test.
	str2.htmlunescape				// This is a test, this is just a test.
	
	str3.trim						// This is a test, this is just a test.
	str3.strip						// This is a test, this is just a test.
	
	str4.tofloat					// 1.8
	str4.todouble					// 1.8
	
	"     ".isblank					// true
	
####License:
Do as you please.  Give credit, don't give credit.  Whatever.