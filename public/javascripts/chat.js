jQuery(function(){
  var Message = Backbone.Model.extend({});

  var Messages = Backbone.Collection.extend({
    model: Message
  });

  window.messages = new Messages();

  var MessageView = Backbone.View.extend({
    tagName: 'li',

    className: 'message',

    template: _.template('<span class="username"><%= username %></span> says: <%= content %>'),

    initialize: function() {
      _.bindAll(this, "render");
      this.model.bind('change', this.render);
    },

    render: function() {
      $(this.el).html(this.template(this.model.toJSON()));
      return this;
    }
  });

  var MessageWindowView = Backbone.View.extend({
    el: $('#messages'),

    initialize: function() {
      _.bindAll(this, "addOne");
      window.messages.bind('add', this.addOne);
    },

    addOne: function(message) {
      var messageView = new MessageView({ model : message });
      $(this.el).append(messageView.render().el);
      $(this.el).scrollTo('100%');
    }
  });

  window.messageWindowView = new MessageWindowView();

  myChannel.bind('message', function(message) {
    window.messages.add(message);
  });
});
