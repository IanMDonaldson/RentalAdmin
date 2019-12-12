validateOrSubmit = function() {
	var fName = document.getElementById("firstName").value;
	var lName = document.getElementById("lastName").value;
	var id = document.getElementById("id").value;
	var ckName = /^[A-Z]{1}[a-z]+$/;
	if (fName == "" || lName == "") {
	    alert("Name must be filled out");
	    return false;
	} else if (!ckName.test(fName) || !ckName.test(lName)) {
	 	alert("Names must be capitalized, with no numbers either.");
	    return false;
	} else { 
		confirm("You're about to add a new actor:\n" + fName + " " + lName
				+ "\nActor's ID: " + id);
		return true;
	}
}/**
 * 
 */