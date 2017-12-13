import { DBFrontEndPage } from './app.po';

describe('dbfront-end App', () => {
  let page: DBFrontEndPage;

  beforeEach(() => {
    page = new DBFrontEndPage();
  });

  it('should display welcome message', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('Welcome to app!');
  });
});
