Popup = React.createClass
  render: ->
    React.DOM.p
      children: 'Hi mom'

React.renderComponent(Popup(), document.getElementById('react'))