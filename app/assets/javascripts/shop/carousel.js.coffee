Product = React.createClass
  getInitialState: ->
    { type: 'Citrus BBQ', size: '1.6oz', title: 'Classic with a tangy twist', price: '4.75', image: 'https://mail.google.com/mail/u/1/?ui=2&ik=85887f679a&view=fimg&th=14c7b5989a943864&attid=0.1&disp=inline&realattid=ii_14c7b578b2f89972&safe=1&attbid=ANGjdJ8d2QFTb8yzvxzozmffHVRoQykrlEAf_Dff7P7zUU3lrUj_hOlEtOzOWZpXO3lLccYsHqVcHzf87l8UhhxGCNsa0R5M1ORAW7Cop2usepp4s4dsK1_ib4Jh1N8&ats=1428000259576&rm=14c7b5989a943864&zw&sz=w1412-h685' }
  citrus: ->
    @setState({ type: 'Spicy BBQ', size: '1.6oz', title: 'Classic with a tangy twist', price: '4.75', image: 'https://mail.google.com/mail/u/1/?ui=2&ik=85887f679a&view=fimg&th=14c7b5989a943864&attid=0.2&disp=inline&realattid=ii_14c7b5787383956d&safe=1&attbid=ANGjdJ9zwOlxUXVIPAYa0sxhsbgPl8j6apWJ7ZLoigyVc9JsSG29jn9c2tUMXfQaIryccGEfD1fNrdbQI6LP66gbHvqgpBup780Fbp7YYQXwyNHrAvPkC0VkgPIXQX8&ats=1428000259576&rm=14c7b5989a943864&zw&sz=w1412-h685' })
  spicy: ->
    @setState({ type: 'Citrus BBQ', size: '1.6oz', title: 'Classic with a other twist', price: '4.75', image: 'https://mail.google.com/mail/u/1/?ui=2&ik=85887f679a&view=fimg&th=14c7b5989a943864&attid=0.1&disp=inline&realattid=ii_14c7b578b2f89972&safe=1&attbid=ANGjdJ8d2QFTb8yzvxzozmffHVRoQykrlEAf_Dff7P7zUU3lrUj_hOlEtOzOWZpXO3lLccYsHqVcHzf87l8UhhxGCNsa0R5M1ORAW7Cop2usepp4s4dsK1_ib4Jh1N8&ats=1428000259576&rm=14c7b5989a943864&zw&sz=w1412-h685' })
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
                    React.DOM.span
                      className: 'title flavor'
                      children: 
                        React.DOM.strong
                          children: 'Choose a flavor'
                    React.DOM.button
                      className: 'swatch'
                      onClick: @citrus
                      children:
                        React.DOM.img
                          src: 'http://cdn.shopify.com/s/files/1/0369/2125/products/2_1024x1024.jpeg?v=1424288357'
                    React.DOM.button
                      className: 'swatch'
                      onClick: @spicy
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
                  className: 'button primary'
                  'data-toggle': 'modal'
                  'data-target': '#checkout'
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