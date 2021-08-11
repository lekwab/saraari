$(function(){
    $("#show-telephone").on("click", function(){
        var $this = $("this");

        $this.find("span").text( $this.data("telephone") );

    });
    
    $("#toggleDetails").on("click", function(){
        var details = $("details");

        details.toggleClass("open");

    });

    $("#book-viewing").on("click", function(){
        var agent_id = $("agent_id").val(),
            first_name = $("viewing-first-name").val(),
            last_name = $("viewing-last-name").val(),
            email = $("viewing-email").val(),
            phone = $("viewing-phone").val();

        $.ajax({
            url: "/agent/viewing",
            method: "POST",
            dataType: "json",
            data: {
                agent_id: agent_id,
                first_name: first_name,
                last_name: last_name,
                email: email,
                phone: phone
            },
            success: function(data){
               $('#viewing-modal: form').remove();
               $('#book').remove();
               $('#viewing-modal: modal-body').html("<p>Your viewing request has been sent successfully!<br/> <%= @agent.first_name %> will be in touch!</p>");
            }
        });
    });
       
    $('#viewing-modal').addEventListener('show.bs.modal', function (event) {
     var button = $(event.relatedTarget);
     var modal = $(this);
    })
});