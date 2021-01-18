import { render, screen } from '@testing-library/react';
import App from './App';

test('renders learn react link', () => {
  render(<App />);
  const linkElement = screen.getAllByText(/jmacks/i);
  expect(linkElement[0]).toHaveTextContent('jmacks');
});
