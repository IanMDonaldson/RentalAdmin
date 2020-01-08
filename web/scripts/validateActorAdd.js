validateActorAdd = function() {
	var fName = document.getElementById("firstName").value;
	var lName = document.getElementById("lastName").value;
	var id = document.getElementById("id").value;
	var ckName = /^[A-Za-z]+$/;
	if (fName == "" || lName == "") {
	    alert("Name must be filled out");
	    return false;
	} else if (!ckName.test(fName) || !ckName.test(lName)) {
	 	alert("Names must have only upper or lowercase letters!.");
	    return false;
	} else { 
		confirm("You're about to add a new actor:\n" + fName + " " + lName
				+ "\nActor's ID: " + id);
		return true;
	}
}/**
 * 
 */