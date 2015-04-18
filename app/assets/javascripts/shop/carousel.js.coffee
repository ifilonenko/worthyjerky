Product = React.createClass
  getInitialState: ->
    { 
      emailErrors: [],
      checkoutErrors: [],
      userEmail: '',
      totalcost: 0, 
      shipping: 0, 
      number: '', 
      name: '', 
      expiry: '', 
      cvc: '', 
      address: '', 
      city: '', 
      zip: '', 
      count: 0, 
      state: '', 
      type: 'Citrus BBQ', 
      size: '1.6oz', 
      title: 'Classic with a tangy twist', 
      price: '4.75', 
      image: 'http://i.imgur.com/BUEmydM.png?1',
      both: false
    }
  addCheckoutError: (err) ->
    errors = @state.checkoutErrors
    errors.push(err)
    @setState({ checkoutErrors: errors })
  updateEmail: (e) ->
    email = e.target.value
    @setState({ userEmail: email })
    console.log(email)
  updateCheckoutParameter: (e) ->
    key = e.target.name
    value = e.target.value
    stateObj = {}
    stateObj[key] = value
    @setState(stateObj)
    console.log(stateObj)

  submitEmail: ->
    if @state.userEmail.length > 0
      @setState({ emailErrors: [] })
      $('#checkoutEmail').slideUp()
      $('#checkoutOther').slideDown()
    else
      @setState({ emailErrors: ['Provide an email to receive your tickets.'] })
  stripeResponseHandler: (status, response) ->
    console.log(JSON.stringify(response))
    if response.error
      console.log(status)
      console.log('Stripe response handler')
      @addCheckoutError(response.error.message)
      $('#finishCheckout').show()
      $('#finishCheckoutDisabled').hide()
      return
    full_address = @state.address + ', ' + @state.city + ', ' + @state.state + ', ' + @state.zip + ', ' + 'United States'
    if @state.both 
      @selection = 'Spicy BBQ and Citrus BBQ'
    else
      @selection = @state.type
    params = {
      token: response.id,
      email: @state.userEmail,
      address: full_address,
      selection: @selection,
      name: @state.name,
      quantity: @state.count
    }
    console.log(params)
    $.ajax({
      type: 'POST'
      url: '/transactions'
      data: params
      dataType: 'JSON'
      success: ((resp) ->
        if resp.success
            alert('Your transaction went through — check your email for your receipt.')
            window.location.reload()
        else
          @addCheckoutError('There was an error with your card. Please try again or contact us for help: admin@worthyjerky.com')
          $('#finishCheckout').show()
          $('#finishCheckoutDisabled').hide()
      ).bind(this)
    })
  finishCheckout: ->
    @setState({ checkoutErrors: [] })
    $('#finishCheckout').hide()
    $('#finishCheckoutDisabled').show()
    exp = @state.expiry
    comps = exp.split('/')
    month = comps[0].trim()
    year = comps[1].trim()
    console.log('Card number: ' + @state.number)
    Stripe.setPublishableKey('pk_live_S0lZaCTcl7JvaIS0C4WcKOqk')
    Stripe.card.createToken({
      number: @state.number
      cvc: @state.cvc
      exp_month: month
      exp_year: year
      name: @state.name
      address_line1: @state.address
      address_city: @state.city
      address_state: @state.state
      address_zip: @state.zip
      address_country: 'US'
    }, @stripeResponseHandler)
  citrus: ->
    @setState({ type: 'Spicy BBQ', size: '1.6oz', title: 'Classic infused with spices', price: '4.75', image: 'http://i.imgur.com/vIGwEdH.png?1' })
  spicy: ->
    @setState({ type: 'Citrus BBQ', size: '1.6oz', title: 'Classic with a tangy twist', price: '4.75', image: 'http://i.imgur.com/BUEmydM.png?1' })
  count: (e)->
    console.log(e.target.value)
    if e.target.value == '6b'
      @setState({ both: true })
    else
      @setState({ both: false })
    value = parseInt(e.target.value)
    shipping = 0
    unitCost = 4.75
    if value == 1
      shipping = 3.25
    else if value == 3 
      shipping = 5.75
    @setState({ count: value, shipping: shipping, totalcost: value*unitCost+shipping})
    console.log(value)
  stateinitial: (e)->
    value = e.target.value
    @setState({ state: value })
    console.log(value)
  render: ->
    emailErrorsBody = @state.emailErrors.map((error) ->
      React.DOM.p
        children: error
    )
    checkoutErrorsBody = @state.checkoutErrors.map((error) ->
      React.DOM.p
        children: error
    )
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
                                  value: '0'
                                  children: 'Select Value'                                
                                React.DOM.option
                                  value: '1'
                                  children: '1 - ' + @state.type
                                React.DOM.option
                                  value: '3'
                                  children: '3 - ' + @state.type
                                React.DOM.option
                                  value: '6'
                                  children: '6 - ' + @state.type
                                React.DOM.option
                                  value: '6b'
                                  children: '6 - Spicy + Citrus'
                              ]
                            React.DOM.div
                              className: 'div-container'
                              children:
                                React.DOM.p
                                  className: 'NumTicketsPrompt'
                                  id: 'costs'
                                  children: [
                                    React.DOM.span
                                      children:
                                        React.DOM.strong
                                          children: @state.count 
                                    React.DOM.span
                                      className: 'normal'
                                      children: 'x ' + '$4.75' + ' + '
                                    React.DOM.span
                                      children:
                                        React.DOM.strong
                                          children: '$' + @state.shipping  
                                    React.DOM.span
                                      className: 'normal'
                                      children: '(shipping)'
                                    React.DOM.span
                                      className: 'normal space'
                                      children: '='
                                    React.DOM.span
                                      children: 
                                        React.DOM.strong
                                          children: '$' + @state.totalcost.toFixed(2)
                                  ]
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
                                          value: @state.number
                                          onChange: @updateCheckoutParameter
                                          className: 'form-control'
                                        React.DOM.input
                                          placeholder: 'Full name'
                                          type: 'text'
                                          name: 'name'
                                          id: 'cardName'
                                          value: @state.name
                                          onChange: @updateCheckoutParameter
                                          className: 'form-control'
                                        React.DOM.input
                                          placeholder: 'MM/YY'
                                          type: 'text'
                                          name: 'expiry'
                                          id: 'cardExpiry'
                                          value: @state.expiry
                                          onChange: @updateCheckoutParameter
                                          className: 'form-control'  
                                        React.DOM.input
                                          placeholder: 'CVC'
                                          type: 'text'
                                          name: 'cvc'
                                          'data-stripe': 'cvc'
                                          rqeuired: 'required'
                                          value: @state.cvc
                                          onChange: @updateCheckoutParameter
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
                                          value: @state.address
                                          onChange: @updateCheckoutParameter
                                        React.DOM.input
                                          placeholder: 'City'
                                          type: 'text'
                                          name: 'city'
                                          id: 'City'
                                          className: 'form-control'   
                                          value: @state.city
                                          onChange: @updateCheckoutParameter
                                        React.DOM.select
                                          className: 'dropdown form-control input'
                                          id: 'State'
                                          required: 'required'
                                          name: 'state'
                                          form: 'carform'
                                          onChange: @stateinitial
                                          children: [
                                            React.DOM.option
                                              value: ""
                                              children: "State"                                            
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
                                          value: @state.zip
                                          onChange: @updateCheckoutParameter                                    
                                        React.DOM.p
                                          className: 'email'
                                          children: [
                                            React.DOM.span
                                              children: 'Email'
                                            React.DOM.span
                                              className: 'normal'
                                              children: '(for confirmation email)'
                                          ]
                                        React.DOM.input
                                          placeholder: 'you@example.com'
                                          type: 'text'
                                          name: 'email'
                                          id: 'Email'
                                          className: 'form-control' 
                                          value: @state.email
                                          onChange: @updateEmail                                          
                                      ]
                                React.DOM.button
                                  className: 'button primary'
                                  id: 'finishCheckout'
                                  onClick: @finishCheckout
                                  children: 'Finish'
                                React.DOM.button
                                  className: 'button primary spinner'
                                  id: 'finishCheckoutDisabled'
                                  disabled: 'disabled'
                                  children:
                                    React.DOM.i
                                      className: 'fa fa-spin fa-spinner'
                                (React.DOM.div
                                  className: 'card-alert alert alert-danger'
                                  children: checkoutErrorsBody
                                ) if checkoutErrorsBody.length > 0
                              ]
                          ]
                  ]
      ]
React.renderComponent(Product(), document.getElementById('react'))