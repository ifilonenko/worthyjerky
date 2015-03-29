Popup = React.createClass
  render: ->
    React.DOM.p
      children: 'Hi bob'

React.renderComponent(Popup(), document.getElementById('react'))