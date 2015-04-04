Product = React.createClass
  getInitialState: ->
    { shipping: 3.25, cc: '', fullname: '', mmyy: '', cvc: '', address: '', city: '', zip: '', count: 1, state: 'AL', type: 'Citrus BBQ', size: '1.6oz', title: 'Classic with a tangy twist', price: '4.75', image: 'https://mail.google.com/mail/u/1/?ui=2&ik=85887f679a&view=fimg&th=14c7b5989a943864&attid=0.1&disp=inline&realattid=ii_14c7b578b2f89972&safe=1&attbid=ANGjdJ8d2QFTb8yzvxzozmffHVRoQykrlEAf_Dff7P7zUU3lrUj_hOlEtOzOWZpXO3lLccYsHqVcHzf87l8UhhxGCNsa0R5M1ORAW7Cop2usepp4s4dsK1_ib4Jh1N8&ats=1428000259576&rm=14c7b5989a943864&zw&sz=w1412-h685' }
  citrus: ->
    @setState({ type: 'Spicy BBQ', size: '1.6oz', title: 'Classic infused with spices', price: '4.75', image: 'https://mail.google.com/mail/u/1/?ui=2&ik=85887f679a&view=fimg&th=14c7b5989a943864&attid=0.2&disp=inline&realattid=ii_14c7b5787383956d&safe=1&attbid=ANGjdJ9zwOlxUXVIPAYa0sxhsbgPl8j6apWJ7ZLoigyVc9JsSG29jn9c2tUMXfQaIryccGEfD1fNrdbQI6LP66gbHvqgpBup780Fbp7YYQXwyNHrAvPkC0VkgPIXQX8&ats=1428000259576&rm=14c7b5989a943864&zw&sz=w1412-h685' })
  spicy: ->
    @setState({ type: 'Citrus BBQ', size: '1.6oz', title: 'Classic with a tangy twist', price: '4.75', image: 'https://mail.google.com/mail/u/1/?ui=2&ik=85887f679a&view=fimg&th=14c7b5989a943864&attid=0.1&disp=inline&realattid=ii_14c7b578b2f89972&safe=1&attbid=ANGjdJ8d2QFTb8yzvxzozmffHVRoQykrlEAf_Dff7P7zUU3lrUj_hOlEtOzOWZpXO3lLccYsHqVcHzf87l8UhhxGCNsa0R5M1ORAW7Cop2usepp4s4dsK1_ib4Jh1N8&ats=1428000259576&rm=14c7b5989a943864&zw&sz=w1412-h685' })
  count: ->
    value = $('#count').val()
    if value == 1 
      @setState({ count: value, shipping: 3.25 })
    if value == 3 
      @setState({ count: value, shipping: 5.75 })
    if value == 6 
      @setState({ count: value, shipping: 0 })
  state: ->
    value = $('#State').val()
    @setState({ state: value })
  render: ->
    React.DOM.div
      children: [
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
        React.DOM.div
          className: 'modal fade'
          id: 'checkout'
          tabindex: '-1'
          role: 'dialog'
          'aria-labelledby': 'myModalLabel'
          'aira-hidden': 'true'
          children:
            React.DOM.div
              className: 'modal-dialog modal-sm'
              children: 
                React.DOM.div
                  className: 'modal-content'
                  children: [
                    React.DOM.div
                      className: 'modal-header'
                      children: [
                        React.DOM.button
                          type: 'button'
                          className: 'close'
                          'data-dismiss': 'modal'
                          'aria-hidden': 'true'
                          children: "\u0078"
                        React.DOM.h4
                          className: 'modal-title'
                          id: 'myModalLabel'
                          children: 'Order for:  ' + @state.type
                      ]
                    React.DOM.div
                      className:'modal-body'
                      children: 
                        React.DOM.section
                          id: 'checkoutOther'
                          children: [
                            React.DOM.p
                              className: 'NumTicketsPrompt'
                              children: 'Number of orders: '
                            React.DOM.select
                              className: 'dropdown form-control input'
                              id: 'count'
                              required: 'required'
                              name: 'carlist'
                              form: 'carform'
                              onChange: @count
                              children: [
                                React.DOM.option
                                  value: '1'
                                  children: '1'
                                React.DOM.option
                                  value: '3'
                                  children: '3'
                                React.DOM.option
                                  value: '6'
                                  children: '6'
                              ]
                            React.DOM.div
                              className: 'div-container'
                              children:
                                React.DOM.p
                                  className: 'NumTicketsPrompt'
                                  children: @state.count + 'x' + '$4.75' + ' + ' + '$' + @state.shipping + '(shipping)' + ' = ' + '$8.00'
                            React.DOM.article
                              id: 'checkoutPayment'
                              children: [
                                React.DOM.div
                                  className: 'card-wrapper'
                                React.DOM.div
                                  className: 'form-container active'
                                  children:
                                    React.DOM.form
                                      id: 'cardForm'
                                      children: [
                                        React.DOM.input
                                          placeholder: 'Card Number'
                                          type: 'text'
                                          name: 'number'
                                          'data-stripe': 'number'
                                          id: 'cardNumber'
                                          className: 'form-control'
                                        React.DOM.input
                                          placeholder: 'Full name'
                                          type: 'text'
                                          name: 'name'
                                          id: 'cardName'
                                          className: 'form-control'
                                        React.DOM.input
                                          placeholder: 'MM/YY'
                                          type: 'text'
                                          name: 'expiry'
                                          id: 'cardExpiry'
                                          className: 'form-control'  
                                        React.DOM.input
                                          placeholder: 'CVC'
                                          type: 'text'
                                          name: 'cvc'
                                          'data-stripe': 'cvc'
                                          id: 'cardCvc'
                                          className: 'form-control required'   
                                        React.DOM.p
                                          className: 'shipping'
                                          children: 'Shipping Address'
                                        React.DOM.input
                                          placeholder: 'Address'
                                          type: 'text'
                                          name: 'address'
                                          id: 'Address'
                                          className: 'form-control'   
                                        React.DOM.input
                                          placeholder: 'City'
                                          type: 'text'
                                          name: 'zip'
                                          id: 'City'
                                          className: 'form-control' 
                                        React.DOM.select
                                          className: 'dropdown form-control input'
                                          id: 'State'
                                          required: 'required'
                                          name: 'carlist'
                                          form: 'carform'
                                          onChange: @state
                                          children: [
                                            React.DOM.option
                                              value: "AL"
                                              children: "AL"
                                            React.DOM.option
                                              value: "AK"
                                              children: "AK"
                                            React.DOM.option
                                              value: "AZ"
                                              children: "AZ"
                                            React.DOM.option
                                              value: "AR"
                                              children: "AR"
                                            React.DOM.option
                                              value: "CA"
                                              children: "CA"
                                            React.DOM.option
                                              value: "CO"
                                              children: "CO"
                                            React.DOM.option
                                              value: "CT"
                                              children: "CT"
                                            React.DOM.option
                                              value: "DE"
                                              children: "DE"
                                            React.DOM.option
                                              value: "DC"
                                              children: "DC"
                                            React.DOM.option
                                              value: "FL"
                                              children: "FL"
                                            React.DOM.option
                                              value: "GA"
                                              children: "GA"
                                            React.DOM.option
                                              value: "HI"
                                              children: "HI"
                                            React.DOM.option
                                              value: "ID"
                                              children: "ID"
                                            React.DOM.option
                                              value: "IL"
                                              children: "IL"
                                            React.DOM.option
                                              value: "IN"
                                              children: "IN"
                                            React.DOM.option
                                              value: "IA"
                                              children: "IA"
                                            React.DOM.option
                                              value: "KS"
                                              children: "KS"
                                            React.DOM.option
                                              value: "KY"
                                              children: "KY"
                                            React.DOM.option
                                              value: "LA"
                                              children: "LA"
                                            React.DOM.option
                                              value: "ME"
                                              children: "ME"
                                            React.DOM.option
                                              value: "MD"
                                              children: "MD"
                                            React.DOM.option
                                              value: "MA"
                                              children: "MA"
                                            React.DOM.option
                                              value: "MI"
                                              children: "MI"
                                            React.DOM.option
                                              value: "MN"
                                              children: "MN"
                                            React.DOM.option
                                              value: "MS"
                                              children: "MS"
                                            React.DOM.option
                                              value: "MO"
                                              children: "MO"
                                            React.DOM.option
                                              value: "MT"
                                              children: "MT"
                                            React.DOM.option
                                              value: "NE"
                                              children: "NE"
                                            React.DOM.option
                                              value: "NV"
                                              children: "NV"
                                            React.DOM.option
                                              value: "NH"
                                              children: "NH"
                                            React.DOM.option
                                              value: "NJ"
                                              children: "NJ"
                                            React.DOM.option
                                              value: "NM"
                                              children: "NM"
                                            React.DOM.option
                                              value: "NY"
                                              children: "NY"
                                            React.DOM.option
                                              value: "NC"
                                              children: "NC"
                                            React.DOM.option
                                              value: "ND"
                                              children: "ND"
                                            React.DOM.option
                                              value: "OH"
                                              children: "OH"
                                            React.DOM.option
                                              value: "OK"
                                              children: "OK"
                                            React.DOM.option
                                              value: "OR"
                                              children: "OR"
                                            React.DOM.option
                                              value: "PA"
                                              children: "PA"
                                            React.DOM.option
                                              value: "RI"
                                              children: "RI"
                                            React.DOM.option
                                              value: "SC"
                                              children: "SC"
                                            React.DOM.option
                                              value: "SD"
                                              children: "SD"
                                            React.DOM.option
                                              value: "TN"
                                              children: "TN"
                                            React.DOM.option
                                              value: "TX"
                                              children: "TX"
                                            React.DOM.option
                                              value: "UT"
                                              children: "UT"
                                            React.DOM.option
                                              value: "VT"
                                              children: "VT"
                                            React.DOM.option
                                              value: "VA"
                                              children: "VA"
                                            React.DOM.option
                                              value: "WA"
                                              children: "WA"
                                            React.DOM.option
                                              value: "WV"
                                              children: "WV"
                                            React.DOM.option
                                              value: "WI"
                                              children: "WI"
                                            React.DOM.option
                                              value: "WY"
                                              children: "WY"
                                          ]
                                        React.DOM.input
                                          placeholder: 'Zip'
                                          type: 'text'
                                          name: 'zip'
                                          id: 'Zip'
                                          className: 'form-control'                                        
                                      ]
                                React.DOM.button
                                  className: 'button primary'
                                  id: 'finishCheckout'
                                  children: 'Finish'
                              ]
                          ]
                  ]
      ]
React.renderComponent(Product(), document.getElementById('react'))