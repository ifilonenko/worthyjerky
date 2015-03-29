Popup = React.createClass
  render: ->
    React.DOM.p
      children: 'Hi mom whats up'

React.renderComponent(Popup(), document.getElementById('react'))