describe('Feeds test', function() {
  it('creates feed', function() {
    const url = 'http://feeds.bbci.co.uk/news/world/rss.xml'

    cy.visit('http://localhost:8080')

    cy.contains('Add Feed').type(`${url}{enter}`)
    cy.get('ul').contains('BBC News - World')
  })

  it('gets feed', function() {
    cy.visit('http://localhost:8080')

    cy.get('ul').contains('BBC News - World')
  })

  it('updates feed', function() {
    const new_url = 'http://www.ruby-lang.org/en/feeds/news.rss'

    cy.visit('http://localhost:8080')

    cy.contains('Edit').click()
    cy.get('.rounded').get('input[type=text]').clear().type(new_url)
    cy.contains('Update').click()

    cy.get('ul').contains('Ruby News')
    cy.get('ul').contains('BBC News - World').should('not.exist')
  })

  it('deletes feed', function() {
    const new_url = 'http://www.ruby-lang.org/en/feeds/news.rss'

    cy.visit('http://localhost:8080')

    cy.contains('Delete').click()

    cy.get('ul').contains('Ruby News').should('not.exist')
    cy.get('ul').contains('BBC News - World').should('not.exist')
  })
})
