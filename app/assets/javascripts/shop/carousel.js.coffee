Product = React.createClass
  getInitialState: ->
    { type: 'Citrus BBQ', size: '1.6oz', title: 'Classic with a tangy twist', price: '4.75', image: 'http://cdn.shopify.com/s/files/1/0369/2125/products/1_1024x1024.jpeg?v=1424288201' }
  citrus: ->
    @setState({ type: 'Citrus BBQ', size: '1.6oz', title: 'Classic with a tangy twist', price: '4.75', image: 'http://cdn.shopify.com/s/files/1/0369/2125/products/1_1024x1024.jpeg?v=1424288201' })
  other: ->
    @setState({ type: 'Other BBQ', size: '1.6oz', title: 'Classic with a other twist', price: '4.75', image: 'http://cdn.shopify.com/s/files/1/0369/2125/products/1_1024x1024.jpeg?v=1424288201' })
  render: ->
    React.DOM.article
      className: 'product'
      children: [
        React.DOM.div
          className: 'article-inner'
          children:
            React.DOM.div
              className: 'row'
              children: [
                React.DOM.div
                  className: 'carousel-gestures'
                  children: 
                    React.DOM.img
                      # style: 'width:100%; height:100%; display: block; margin-top:-150px;'
                      src: @state.image
                React.DOM.aside
                  children: [
                    React.DOM.h1
                      children: @state.type
                    React.DOM.p
                      children: @state.size
                    React.DOM.hr({})
                    React.DOM.div
                      className: 'price-wrapper'
                      children: [
                        React.DOM.p
                          className: 'price active'
                          'data-value': 'walnut'
                          children: [
                            React.DOM.span
                              className: 'title'
                              children: 
                                React.DOM.strong
                                  children: @state.title
                            React.DOM.span
                              className: 'curr_symbol'
                              children: '$'
                            React.DOM.span
                              className: 'curr_amt'
                              children: @state.price
                            React.DOM.span
                              className: 'curr_abbrev'
                              children: 'USD'
                          ]
                        React.DOM.p
                          className: 'price'
                          'data-value': 'gold'
                          children: [
                            React.DOM.span
                              className: 'title'
                              children: 
                                React.DOM.strong
                                  children: 'Classic with a tangy twist'
                            React.DOM.span
                              className: 'curr_symbol'
                              children: '$'
                            React.DOM.span
                              className: 'curr_amt'
                              children: '5.00'
                            React.DOM.span
                              className: 'curr_abbrev'
                              children: 'USD'
                          ]
                      ]
                    React.DOM.div
                      className: 'price-banner'
                      children: [
                        React.DOM.span
                          children: 'Free shipping with 6 orders'
                      ]
                    React.DOM.button
                      className: 'swatch'
                      onClick: @citrus
                      children:
                        React.DOM.img
                          src: @state.image
                    React.DOM.button
                      className: 'swatch'
                      onClick: @other
                      children:
                        React.DOM.img
                          src: 'http://cdn.shopify.com/s/files/1/0369/2125/products/1_1024x1024.jpeg?v=1424288201'
                    React.DOM.hr({})
                  ]
                     
              ]
        React.DOM.div
          className: 'article-outer'
          children: 
            React.DOM.div
              className: 'form-wrapper'
              children: 
                React.DOM.button
                  className: 'btn primary'
                  id: 'btnAddCart'
                  children: [
                    'Add to cart'
                  ]
      ]

Simple = React.createClass
  render: ->
    React.DOM.h1
      children: 'Hi mom'
React.renderComponent(Product(), document.getElementById('react'))