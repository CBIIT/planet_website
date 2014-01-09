	var monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
    var modiDate = new Date(document.lastModified);
    var showAs = monthNames[modiDate.getMonth()] + " " + modiDate.getDate() + ", " + modiDate.getFullYear();
	document.write ("Last update date: " + showAs);