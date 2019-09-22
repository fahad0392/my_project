//profile pop up with users details
$('#sidebar').find('#profiletag').click(function(){
        $.ajax({
            type: 'GET',
            url: '/getprofile/',
            cache: true,
            success: function (data) {
                $('#myProfileModal').find('.modal-body').find('#firstName').text("First Name: "+data.first_name+"")
                $('#myProfileModal').find('.modal-body').find('#lastName').text("Last Name: "+data.last_name+"")
                $('#myProfileModal').find('.modal-body').find('#email').text("Email: "+data.email+"")
        }
      });
})


$('body').on('hidden.bs.modal', '.modal', function () {
        $(this).removeData('bs.modal');
      });