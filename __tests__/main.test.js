import App from '../src/Main.bs'

describe('the application', () => {
  it('should prompt for an input', () => {
    expect(typeof App()).toBe('string')
  })
})
