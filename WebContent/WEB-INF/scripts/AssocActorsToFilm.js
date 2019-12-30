/**
 * 
 */
var list =$("ul"), origOrder = list.children();
list.on("click", ":checkbox", function() {
	var i, checked = document.createDocumentFragment(),
		unchecked = document.createDocumentFragment();
	for (i=0; i < origOrder.length; i++) {
		if (origOrder[i].getElementsByTagName("input")[0].checked) {
			checked.appendChild(origOrder[i]);
		} else {
			unchecked.appendChild(origOrder[i]);
		}
	}
	list.append(checked).append(unchecked);
});
