Popup = React.createClass
  render: ->
    React.DOM.div
      id: 'login-view'
      children: [
        React.DOM.div
          className: 'banner'
          children: [
            React.DOM.div
              className: 'left-column'
              children:
                React.DOM.div
                  id: 'logo'
                  className: 'sprite'
            React.DOM.div
              className: 'middle-column'
              children: 
                React.DOM.span
                  className: 'banner-add'
                  children: 'Welcome to DeChat'
            React.DOM.div
              className: 'right-column'
              children: 
                React.DOM.a
                  id:  'close_login'
                  className: 'sprite close-x'
                  tabindex: '-1'
          ]
        React.DOM.div
          className: 'content'
          children: [
            'Enter a chatroom by creating a username'
            React.DOM.input
              className: 'form-control'
              placeholder: 'Username'
              required: 'required'
              type: 'username'
              id: 'username'
            React.DOM.button
              name: 'button'
              type: 'submit'
              class: 'btn btn-large btn-primary'
              children: 'Submit'
          ]
      ]
React.renderComponent(Popup(), document.getElementById('react-content'))