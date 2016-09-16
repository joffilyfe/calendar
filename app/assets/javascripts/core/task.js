var app = {};
app.atartApp = function() {
  $.getJSON('/api/v1/task', function(response) {
    var events = response.map(function(event) {
      return {title: event.title, description: event.description, start: event.date, url: '/core/tasks/' + event.id + '/edit' };
    })

    $('#calendar').fullCalendar({
      customButtons: {
        newTaskButton: {
            text: 'New Task',
            click: function() {
                window.location.href = '/core/tasks/new'
            }
        },
        taskListButton: {
          text: 'Task List',
          click: function() {
            window.location.href = '/core/tasks'
          }
        }
      },
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'newTaskButton,taskListButton'
      },
      defaultDate: '2016-09-12',
      navLinks: true,
      editable: false,
      eventLimit: true,
      events: events,
      selectable: false,
      selectHelper: true,
      select: function(start, end) {
        var title = prompt('Event Title:');
        var eventData;
        if (title && title.length >= 5) {
          eventData = { title: title, start: start };
          $.ajax({
            method: 'POST',
            url: '/api/v1/task',
            data: { title: title, start: start.toString()},
          }).done(function(e) {
            console.log(e);
            $('#calendar').fullCalendar('renderEvent', eventData, true);
          }).error(function(e) {
            console.log(e);
          });
        } else {
          alert("You need pass a title with length bit than 5 character.");
        }
        $('#calendar').fullCalendar('unselect');
      },
    });
  });
}
