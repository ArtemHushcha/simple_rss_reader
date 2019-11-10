describe('My First Test', function() {
  it('finds the create feed button', function() {
    cy.visit('http://localhost:8080')

    cy.contains('Add Feed')
  })
})
