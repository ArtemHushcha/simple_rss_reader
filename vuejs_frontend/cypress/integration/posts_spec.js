describe('Feeds test', function() {
  it('gets posts', function() {
    const url = 'http://www.ruby-lang.org/en/feeds/news.rss'

    cy.request('POST', 'http://localhost:3000/api/v1/feeds', {
      url: url
    })

    cy.visit('http://localhost:8080/#/posts')

    cy.get('ul').contains('Ruby 2.7.0-preview2 Released')
  })
})
