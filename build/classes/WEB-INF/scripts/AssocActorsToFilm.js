/**
 *
 */
let actors = [];
let list = $("ul"), origOrder = list.children();
list.on("click", ":checkbox", function() {
	let i, checked = document.createDocumentFragment(),
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
$('#myForm').onsubmit(function() {
	$("input:checked").each(function () {
		let $this = $(this);
		if ($this.is("checked")) {
			actors.push($this.attr("id"));
			$('hiddenActors').val(actors);
		}
	})
});
