let actors = [];
let inputs = document.getElementsByTagName("input");
for (let i = 0; i < inputs.length; i++) {
    if (inputs[i].checked) {
        actors.push(inputs[i].getAttribute("id"));
        console.log(actors);
    }
}
$(document).on("ready", function() {
    $(".act").on("click", function(event) {
        let selectedNo = $(event.target).attr("id");
        let index = $.inArray(selectedNo, actors);
        if (index !== -1) { // means found so pop it
            actors.splice(index, 1);
        } else {
            actors.push(selectedNo);
        }

        actors.sort();
        //attempt to move shit to the top :(
        /*let assoc = $(".prevAssoc").children("li");
        let unassoc = $(".prevUnassoc");
        let labelfor = $(this).closest('label');
        let insertion = $("<li><label>"+$(this) +labelfor+"</label></li><br>")[0];
        if ($(this).prop('checked')) { // move to top
            $('<input />', {
                type : 'checkbox',
                id: $(this).attr("id"),
                class: 'act',
                checked: 'checked'
            }).appendTo(assoc);
            unassoc.remove($(this));
        } else {
            unassoc.prepend($(this));
        }*/
        console.log(actors);
    });
});
$(document).on("submit", function() {
    let actorsSel = actors.join(",");
    $('input:hidden[name="hiddenActors"]').val(actorsSel);
});
